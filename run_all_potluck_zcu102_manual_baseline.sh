#!/usr/bin/env bash
set -uo pipefail

CONDA_ENV_NAME="Potluck_env"
SOURCE_CORE="Potluck_Final"
BASELINE_BENCH_ROOT="Potluck_Benchmark_Baseline"
MANUAL_ARCH_ROOT="Potluck_Manual_Arch"
RUN_ROOT_BASE="Potluck_AE_Manual_Baseline_Runs"
VIVADO_ROOT_BASE="Vivado_project"

DRY_RUN=0
KEEP_GOING=0
FORCE=0
PARALLEL_JOBS=1
MAX_JOBS=0
MAX_JOBS_PER_DESIGN=0
RUN_ID="${POTLUCK_AE_RUN_ID:-$(date +%Y%m%d_%H%M%S)}"
ENABLE_BASELINE=1
ENABLE_MANUAL_ARCH=1
BASELINE_PHASES="1 2 3"

BASELINE_GROUPS=(
  "normal|DNN_block|DNN_block|1 4 8"
  "normal|attention_module|attention_module|1 4 32"
  "normal|conv_act|conv_act|1 4 16"
  "normal|moe_layer|moe_layer|1 4 32"
  "normal|streaming_bench_1|streaming_bench_1|1 4 32"
  "normal|streaming_bench_2|streaming_bench_2|16 32 64"
  "high|high_frequency_bench_1|high_frequency_bench_1|4 16 64"
  "high|high_frequency_bench_2|high_frequency_bench_2|4 32 64"
)

MANUAL_ARCH_GROUPS=(
  "normal|DNN_block|DNN_block|1 4 8"
  "normal|attention_module|attention_module|1 4 32"
  "normal|conv_act|conv_act|1 4 16"
  "normal|moe_layer|moe_layer|1 4 16"
  "normal|streaming_bench_1|streaming_bench_1|1 4 32"
  "normal|streaming_bench_2|streaming_bench_2|16 32 64"
  "high|high_frequency_bench_1|high_frequency_bench_1|4 16 64"
  "high|high_frequency_bench_2|high_frequency_bench_2|4 32 64"
)

usage() {
  cat <<'EOF'
Usage: ./run_all_potluck_zcu102_manual_baseline.sh [options]

Runs the ZCU102 manual-architecture and baseline design-generation jobs.

Default job set:
  baseline     8 benchmarks x 3 unrolls x P1/P2/P3 = 72 jobs
  manual_arch  8 benchmarks x 3 unrolls             = 24 jobs

Options:
  --dry-run             Print the job plan without creating files or running tools.
  --keep-going          Continue after a failed job and record failures in summary.csv.
  --force               Remove existing run directories with the selected run id.
  -j, --jobs N          Run up to N design-generation jobs in parallel. Default: 1.
  --max-jobs N          Launch only the first N jobs from the selected plan. Default: all.
  --max-jobs-per-design N
                        Launch only the first N baseline jobs and the first N manual_arch jobs.
  --run-id NAME         Use Potluck_AE_Manual_Baseline_Runs/NAME instead of a timestamp.
  --designs LIST        Comma-separated list: baseline,manual_arch. Default: both.
  --baseline-phases L   Comma-separated baseline phases to run. Default: 1,2,3.
  -h, --help            Show this help.

The script creates and installs Conda environment Potluck_env only when it
does not already exist. If Potluck_env exists, dependency installation is
skipped. Dependencies are installed from requirements.txt in the artifact root.

All runner invocations explicitly use --debug:
  baseline normal       run_ArchHLS_zcu102_baseline.sh --debug
  baseline high         run_ArchHLS_zcu102_baseline_high_frequency.sh --debug
  manual_arch normal    run_ArchHLS_zcu102_baseline_arch.sh --debug
  manual_arch high      run_ArchHLS_zcu102_baseline_arch_high_frequency.sh --debug

For every job, the script copies Potluck_Final into an isolated work directory,
copies the generated Vitis HLS RTL source tree into that work directory, writes
the job-specific m_axi interface list, and passes the copied RTL directory as
<synthesized_source_file_path>. This prevents debug-port patching from mutating
the original HLS synthesis output.
EOF
}

timestamp() {
  date +%Y-%m-%dT%H:%M:%S%z
}

die() {
  echo "ERROR: $*" >&2
  exit 1
}

info() {
  echo "[$(timestamp)] $*"
}

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

csv_to_words() {
  printf '%s' "$1" | tr ',' ' '
}

safe_token() {
  printf '%s' "$1" | tr '/:,' '___'
}

parse_designs() {
  local raw="$1"
  local item

  ENABLE_BASELINE=0
  ENABLE_MANUAL_ARCH=0
  for item in $(csv_to_words "$raw"); do
    case "$item" in
      baseline)
        ENABLE_BASELINE=1
        ;;
      manual_arch|manual)
        ENABLE_MANUAL_ARCH=1
        ;;
      *)
        die "unknown design in --designs: ${item}"
        ;;
    esac
  done

  if [ "$ENABLE_BASELINE" -eq 0 ] && [ "$ENABLE_MANUAL_ARCH" -eq 0 ]; then
    die "--designs selected no jobs"
  fi
}

parse_baseline_phases() {
  local raw="$1"
  local item phases=""

  for item in $(csv_to_words "$raw"); do
    case "$item" in
      1|2|3)
        phases="${phases} ${item}"
        ;;
      *)
        die "unknown phase in --baseline-phases: ${item}"
        ;;
    esac
  done

  phases="${phases# }"
  [ -n "$phases" ] || die "--baseline-phases selected no phases"
  BASELINE_PHASES="$phases"
}

while [ "$#" -gt 0 ]; do
  case "$1" in
    --dry-run)
      DRY_RUN=1
      shift
      ;;
    --keep-going)
      KEEP_GOING=1
      shift
      ;;
    --force)
      FORCE=1
      shift
      ;;
    -j|--jobs)
      [ "$#" -ge 2 ] || die "$1 requires a positive integer"
      PARALLEL_JOBS="$2"
      shift 2
      ;;
    -j[1-9]*)
      PARALLEL_JOBS="${1#-j}"
      shift
      ;;
    --max-jobs)
      [ "$#" -ge 2 ] || die "--max-jobs requires a positive integer"
      MAX_JOBS="$2"
      shift 2
      ;;
    --max-jobs-per-design)
      [ "$#" -ge 2 ] || die "--max-jobs-per-design requires a positive integer"
      MAX_JOBS_PER_DESIGN="$2"
      shift 2
      ;;
    --run-id)
      [ "$#" -ge 2 ] || die "--run-id requires a value"
      RUN_ID="$2"
      shift 2
      ;;
    --designs)
      [ "$#" -ge 2 ] || die "--designs requires a comma-separated value"
      parse_designs "$2"
      shift 2
      ;;
    --baseline-phases)
      [ "$#" -ge 2 ] || die "--baseline-phases requires a comma-separated value"
      parse_baseline_phases "$2"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      die "unknown option: $1"
      ;;
  esac
done

[[ "$PARALLEL_JOBS" =~ ^[1-9][0-9]*$ ]] || die "--jobs requires a positive integer"
[[ "$MAX_JOBS" =~ ^[0-9]+$ ]] || die "--max-jobs requires a positive integer"
[[ "$MAX_JOBS_PER_DESIGN" =~ ^[0-9]+$ ]] || die "--max-jobs-per-design requires a positive integer"
if [ "$MAX_JOBS" -eq 0 ]; then
  MAX_JOBS_LABEL="all"
else
  MAX_JOBS_LABEL="$MAX_JOBS"
fi
if [ "$MAX_JOBS_PER_DESIGN" -eq 0 ]; then
  MAX_JOBS_PER_DESIGN_LABEL="all"
else
  MAX_JOBS_PER_DESIGN_LABEL="$MAX_JOBS_PER_DESIGN"
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR" || exit 1

RUN_ROOT="${RUN_ROOT_BASE}/${RUN_ID}"
VIVADO_RUN_ROOT="${VIVADO_ROOT_BASE}/${RUN_ID}/manual_baseline"
LOG_DIR="${RUN_ROOT}/logs"
LOCK_DIR="${RUN_ROOT}/locks"
STATUS_DIR="${RUN_ROOT}/status"
SUMMARY_PART_DIR="${RUN_ROOT}/summary_parts"
SUMMARY_FILE="${RUN_ROOT}/summary.csv"
SUMMARY_HEADER="design,benchmark,unroll,phase,flow,status,start_time,end_time,workdir,vivado_root,synthesized_source,log_path"

merge_parallel_summaries() {
  local summary_part tmp_summary

  [ "$DRY_RUN" -eq 0 ] || return 0
  [ "$PARALLEL_JOBS" -gt 1 ] || return 0
  [ -d "$SUMMARY_PART_DIR" ] || return 0

  tmp_summary="${SUMMARY_FILE}.tmp"
  printf '%s\n' "$SUMMARY_HEADER" > "$tmp_summary" || return 1
  for summary_part in "$SUMMARY_PART_DIR"/*.csv; do
    [ -e "$summary_part" ] || continue
    cat "$summary_part" >> "$tmp_summary" || return 1
  done
  mv "$tmp_summary" "$SUMMARY_FILE"
}

handle_interrupt() {
  info "Interrupted; stopping active jobs."
  trap - INT TERM
  jobs -pr | xargs -r kill 2>/dev/null || true
  wait 2>/dev/null || true
  exit 130
}

handle_exit() {
  local rc=$?
  merge_parallel_summaries || true
  exit "$rc"
}

trap handle_interrupt INT TERM
trap handle_exit EXIT

init_conda() {
  if declare -F conda >/dev/null 2>&1 || command_exists conda; then
    return 0
  fi

  local conda_sh=""
  if [ -n "${CONDA_EXE:-}" ]; then
    conda_sh="$(dirname "$(dirname "$CONDA_EXE")")/etc/profile.d/conda.sh"
    if [ -f "$conda_sh" ]; then
      # shellcheck source=/dev/null
      source "$conda_sh"
      return 0
    fi
  fi

  for conda_sh in \
    "$HOME/miniconda3/etc/profile.d/conda.sh" \
    "$HOME/anaconda3/etc/profile.d/conda.sh"; do
    if [ -f "$conda_sh" ]; then
      # shellcheck source=/dev/null
      source "$conda_sh"
      return 0
    fi
  done

  return 1
}

conda_env_exists() {
  conda env list | awk '{print $1}' | grep -Fxq "$CONDA_ENV_NAME"
}

setup_conda_env() {
  if [ "$DRY_RUN" -eq 1 ]; then
    info "Dry run: would check Conda environment ${CONDA_ENV_NAME}."
    info "Dry run: if missing, would run: conda create -y -n ${CONDA_ENV_NAME} python=3.9.16 pip"
    info "Dry run: if missing, would run: conda run -n ${CONDA_ENV_NAME} python -m pip install -r requirements.txt"
    return 0
  fi

  init_conda || die "conda is not available. Source Conda first or make conda available in PATH."

  if conda_env_exists; then
    info "Conda environment ${CONDA_ENV_NAME} exists; skipping creation and dependency install."
    return 0
  fi

  info "Creating Conda environment ${CONDA_ENV_NAME}."
  conda create -y -n "$CONDA_ENV_NAME" python=3.9.16 pip || return 1

  info "Installing Python dependencies from requirements.txt."
  conda run -n "$CONDA_ENV_NAME" python -m pip install -r requirements.txt || return 1
}

preflight_tools() {
  [ "$DRY_RUN" -eq 1 ] && return 0
  command_exists vivado || die "vivado is not available in PATH"
  command_exists vitis_hls || die "vitis_hls is not available in PATH"
}

preflight_static_files() {
  local group flow bench hls_bench unrolls unroll phase

  [ -d "$SOURCE_CORE" ] || die "missing ${SOURCE_CORE}"
  [ -d "$BASELINE_BENCH_ROOT" ] || die "missing ${BASELINE_BENCH_ROOT}"
  [ -d "$MANUAL_ARCH_ROOT" ] || die "missing ${MANUAL_ARCH_ROOT}"
  [ -f "requirements.txt" ] || die "missing requirements.txt in artifact root"

  [ -f "${SOURCE_CORE}/run_ArchHLS_zcu102_baseline.sh" ] || die "missing ${SOURCE_CORE}/run_ArchHLS_zcu102_baseline.sh"
  [ -f "${SOURCE_CORE}/run_ArchHLS_zcu102_baseline_high_frequency.sh" ] || die "missing ${SOURCE_CORE}/run_ArchHLS_zcu102_baseline_high_frequency.sh"
  [ -f "${SOURCE_CORE}/run_ArchHLS_zcu102_baseline_arch.sh" ] || die "missing ${SOURCE_CORE}/run_ArchHLS_zcu102_baseline_arch.sh"
  [ -f "${SOURCE_CORE}/run_ArchHLS_zcu102_baseline_arch_high_frequency.sh" ] || die "missing ${SOURCE_CORE}/run_ArchHLS_zcu102_baseline_arch_high_frequency.sh"
  [ -f "${SOURCE_CORE}/generate_bitstream_baseline_debug.tcl" ] || die "missing normal-frequency baseline debug Tcl in ${SOURCE_CORE}"
  [ -f "${SOURCE_CORE}/generate_bitstream_baseline_debug_250_mhz.tcl" ] || die "missing high-frequency baseline debug Tcl in ${SOURCE_CORE}"
  [ -f "${SOURCE_CORE}/generate_bitstream_bram_baseline_debug_arch.tcl" ] || die "missing normal-frequency manual debug Tcl in ${SOURCE_CORE}"
  [ -f "${SOURCE_CORE}/generate_bitstream_bram_baseline_debug_arch_250_mhz.tcl" ] || die "missing high-frequency manual debug Tcl in ${SOURCE_CORE}"

  if [ "$ENABLE_BASELINE" -eq 1 ]; then
    for group in "${BASELINE_GROUPS[@]}"; do
      IFS='|' read -r flow bench hls_bench unrolls <<< "$group"
      [ -d "${BASELINE_BENCH_ROOT}/${hls_bench}" ] || die "missing baseline benchmark directory ${BASELINE_BENCH_ROOT}/${hls_bench}"
      for unroll in $unrolls; do
        for phase in $BASELINE_PHASES; do
          [ -f "${BASELINE_BENCH_ROOT}/${hls_bench}/run_hls_p${phase}_unroll_${unroll}.tcl" ] || \
            die "missing ${BASELINE_BENCH_ROOT}/${hls_bench}/run_hls_p${phase}_unroll_${unroll}.tcl"
        done
      done
    done
  fi

  if [ "$ENABLE_MANUAL_ARCH" -eq 1 ]; then
    for group in "${MANUAL_ARCH_GROUPS[@]}"; do
      IFS='|' read -r flow bench hls_bench unrolls <<< "$group"
      [ -d "${MANUAL_ARCH_ROOT}/${hls_bench}" ] || die "missing manual benchmark directory ${MANUAL_ARCH_ROOT}/${hls_bench}"
      for unroll in $unrolls; do
        [ -f "${MANUAL_ARCH_ROOT}/${hls_bench}/run_hls_unroll_${unroll}.tcl" ] || \
          die "missing ${MANUAL_ARCH_ROOT}/${hls_bench}/run_hls_unroll_${unroll}.tcl"
        [ -f "${MANUAL_ARCH_ROOT}/${hls_bench}/unroll_${unroll}.cpp" ] || \
          die "missing ${MANUAL_ARCH_ROOT}/${hls_bench}/unroll_${unroll}.cpp"
      done
    done
  fi
}

project_name_from_tcl() {
  local tcl_file="$1"
  awk '/^[[:space:]]*open_project[[:space:]]/ {print $NF; exit}' "$tcl_file"
}

baseline_hls_tcl_name() {
  local phase="$1"
  local unroll="$2"
  printf 'run_hls_p%s_unroll_%s.tcl' "$phase" "$unroll"
}

manual_hls_tcl_name() {
  local unroll="$1"
  printf 'run_hls_unroll_%s.tcl' "$unroll"
}

hls_solution_path() {
  local hls_root="$1"
  local hls_bench="$2"
  local tcl_name="$3"
  local tcl_file="${hls_root}/${hls_bench}/${tcl_name}"
  local project

  project="$(project_name_from_tcl "$tcl_file")"
  [ -n "$project" ] || return 1
  printf '%s/%s/%s/solution1' "$hls_root" "$hls_bench" "$project"
}

validate_hls_syn_verilog() {
  local solution_dir="$1"
  [ -f "${solution_dir}/syn/verilog/top.v" ]
}

acquire_hls_lock() {
  local lock_key="$1"
  local log_file="$2"
  local safe_key lock_path

  safe_key="$(safe_token "$lock_key")"
  lock_path="${LOCK_DIR}/hls_${safe_key}.lock"
  mkdir -p "$LOCK_DIR" || return 1
  while ! mkdir "$lock_path" 2>/dev/null; do
    echo "[$(timestamp)] INFO: waiting for HLS lock ${lock_path}" >> "$log_file"
    sleep 30
  done
}

release_hls_lock() {
  local lock_key="$1"
  local safe_key lock_path

  safe_key="$(safe_token "$lock_key")"
  lock_path="${LOCK_DIR}/hls_${safe_key}.lock"
  rmdir "$lock_path" 2>/dev/null || true
}

run_hls_if_needed() {
  local hls_root="$1"
  local hls_bench="$2"
  local tcl_name="$3"
  local log_file="$4"
  local solution_dir lock_key rc

  solution_dir="$(hls_solution_path "$hls_root" "$hls_bench" "$tcl_name")" || return 1
  if validate_hls_syn_verilog "$solution_dir"; then
    echo "[$(timestamp)] INFO: HLS RTL already exists at ${solution_dir}/syn/verilog" >> "$log_file"
    return 0
  fi

  lock_key="${hls_root}_${hls_bench}"
  acquire_hls_lock "$lock_key" "$log_file" || return 1

  if validate_hls_syn_verilog "$solution_dir"; then
    echo "[$(timestamp)] INFO: HLS RTL was prepared by another job at ${solution_dir}/syn/verilog" >> "$log_file"
    release_hls_lock "$lock_key"
    return 0
  fi

  echo "[$(timestamp)] CMD: (cd ${hls_root}/${hls_bench} && vitis_hls -f ${tcl_name})" | tee -a "$log_file"
  (cd "${hls_root}/${hls_bench}" && vitis_hls -f "$tcl_name") >> "$log_file" 2>&1
  rc=$?
  echo "[$(timestamp)] EXIT: ${rc}" >> "$log_file"
  if [ "$rc" -ne 0 ]; then
    release_hls_lock "$lock_key"
    return "$rc"
  fi

  if ! validate_hls_syn_verilog "$solution_dir"; then
    echo "[$(timestamp)] ERROR: expected HLS RTL top.v at ${solution_dir}/syn/verilog/top.v" >> "$log_file"
    release_hls_lock "$lock_key"
    return 1
  fi

  release_hls_lock "$lock_key"
}

prepare_work_dir() {
  local work_dir="$1"

  if [ -e "$work_dir" ]; then
    if [ "$FORCE" -eq 1 ]; then
      rm -rf "$work_dir" || return 1
    else
      echo "work directory already exists: ${work_dir}" >&2
      return 1
    fi
  fi

  mkdir -p "$(dirname "$work_dir")" || return 1
  cp -a "$SOURCE_CORE" "$work_dir" || return 1
  rm -rf "${work_dir}/FPGA_deploy"
}

copy_synthesized_source() {
  local solution_dir="$1"
  local work_dir="$2"
  local source_copy_name="$3"
  local log_file="$4"
  local src_dir="${solution_dir}/syn/verilog"
  local dst_dir="${work_dir}/${source_copy_name}"

  [ -f "${src_dir}/top.v" ] || return 1
  rm -rf "$dst_dir" || return 1
  mkdir -p "$dst_dir" || return 1
  cp -a "${src_dir}/." "$dst_dir/" || return 1
  [ -f "${dst_dir}/top.v" ] || return 1
  echo "[$(timestamp)] INFO: copied synthesized source ${src_dir} to ${dst_dir}" >> "$log_file"
}

write_m_axi_interface_file() {
  local source_dir="$1"
  local output_file="$2"
  local log_file="$3"
  local top_v="${source_dir}/top.v"
  local suffix_re
  local count

  suffix_re='AWVALID|AWREADY|AWADDR|AWLEN|AWSIZE|AWBURST|AWLOCK|AWCACHE|AWPROT|AWQOS|AWREGION|AWID|AWUSER|WVALID|WREADY|WDATA|WSTRB|WLAST|WID|WUSER|BVALID|BREADY|BRESP|BID|BUSER|ARVALID|ARREADY|ARADDR|ARLEN|ARSIZE|ARBURST|ARLOCK|ARCACHE|ARPROT|ARQOS|ARREGION|ARID|ARUSER|RVALID|RREADY|RDATA|RRESP|RLAST|RID|RUSER'
  : > "$output_file" || return 1
  grep -Eoh "m_axi_[A-Za-z0-9_]+_(${suffix_re})" "$top_v" 2>/dev/null | \
    sed -E "s/_(${suffix_re})$//" | sort -u > "$output_file"

  count="$(wc -l < "$output_file" | tr -d ' ')"
  if [ "$count" = "0" ]; then
    echo "[$(timestamp)] WARNING: no m_axi interfaces were extracted from ${top_v}" >> "$log_file"
  else
    echo "[$(timestamp)] INFO: wrote ${count} m_axi interface(s) to ${output_file}" >> "$log_file"
    sed 's/^/[interface] /' "$output_file" >> "$log_file"
  fi
}

manual_inst_length_from_cpp() {
  local cpp_file="$1"
  sed -nE 's/^[[:space:]]*#define[[:space:]]+DATA_TYPE_INST[[:space:]]+ap_u?int<([0-9]+)>.*$/\1/p' "$cpp_file" | head -n 1
}

write_manual_inst_length_file() {
  local hls_bench="$1"
  local unroll="$2"
  local work_dir="$3"
  local log_file="$4"
  local cpp_file="${MANUAL_ARCH_ROOT}/${hls_bench}/unroll_${unroll}.cpp"
  local bits

  bits="$(manual_inst_length_from_cpp "$cpp_file")"
  if [ -z "$bits" ]; then
    bits="64"
    echo "[$(timestamp)] WARNING: could not infer DATA_TYPE_INST width from ${cpp_file}; using ${bits}" >> "$log_file"
  fi

  printf '%s\n' "$bits" > "${work_dir}/inst_length.txt" || return 1
  echo "[$(timestamp)] INFO: wrote manual instruction width ${bits} to ${work_dir}/inst_length.txt" >> "$log_file"
}

runner_for_job() {
  local design="$1"
  local flow="$2"

  if [ "$design" = "baseline" ]; then
    if [ "$flow" = "high" ]; then
      printf 'run_ArchHLS_zcu102_baseline_high_frequency.sh'
    else
      printf 'run_ArchHLS_zcu102_baseline.sh'
    fi
  else
    if [ "$flow" = "high" ]; then
      printf 'run_ArchHLS_zcu102_baseline_arch_high_frequency.sh'
    else
      printf 'run_ArchHLS_zcu102_baseline_arch.sh'
    fi
  fi
}

run_archhls_runner() {
  local design="$1"
  local flow="$2"
  local work_dir="$3"
  local vivado_dir="$4"
  local source_copy_name="$5"
  local log_file="$6"
  local runner vivado_arg interface_file
  local -a cmd

  runner="$(runner_for_job "$design" "$flow")"
  vivado_arg="../../../${vivado_dir}"
  if [ "$design" = "baseline" ]; then
    interface_file="m_axi_interface_baseline.txt"
  else
    interface_file="m_axi_interface.txt"
  fi

  mkdir -p "$vivado_dir" || return 1
  cmd=(bash "./${runner}" --debug --conda-env "$CONDA_ENV_NAME" "$vivado_arg" "$source_copy_name")
  echo "[$(timestamp)] CMD: (cd ${work_dir} && ${cmd[*]})" | tee -a "$log_file"
  echo "[$(timestamp)] INFO: runner uses ${interface_file}; --debug is always enabled by this script" >> "$log_file"
  (cd "$work_dir" && "${cmd[@]}") >> "$log_file" 2>&1
  local rc=$?
  echo "[$(timestamp)] EXIT: ${rc}" >> "$log_file"
  return "$rc"
}

append_summary() {
  local design="$1"
  local bench="$2"
  local unroll="$3"
  local phase="$4"
  local flow="$5"
  local status="$6"
  local start_time="$7"
  local end_time="$8"
  local work_dir="$9"
  local vivado_dir="${10}"
  local source_dir="${11}"
  local log_file="${12}"
  local summary_file="${13:-$SUMMARY_FILE}"

  printf '%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s\n' \
    "$design" "$bench" "$unroll" "$phase" "$flow" "$status" "$start_time" "$end_time" \
    "$work_dir" "$vivado_dir" "$source_dir" "$log_file" >> "$summary_file"
}

run_design_job() {
  local design="$1"
  local flow="$2"
  local bench="$3"
  local hls_root="$4"
  local hls_bench="$5"
  local unroll="$6"
  local phase="$7"
  local summary_file="${8:-$SUMMARY_FILE}"
  local phase_tag work_dir vivado_dir log_file tcl_name solution_dir source_copy_name source_dir interface_file
  local start_time end_time status

  if [ "$phase" = "manual" ]; then
    phase_tag="manual"
  else
    phase_tag="p${phase}"
  fi

  work_dir="${RUN_ROOT}/Potluck_Final_${design}_${bench}_${phase_tag}_unroll_${unroll}"
  vivado_dir="${VIVADO_RUN_ROOT}/${design}/${bench}/unroll_${unroll}/${phase_tag}"
  log_file="${LOG_DIR}/${design}_${bench}_${phase_tag}_unroll_${unroll}.log"
  source_copy_name="synthesized_source_${phase_tag}"
  source_dir="${work_dir}/${source_copy_name}"

  if [ "$design" = "baseline" ]; then
    tcl_name="$(baseline_hls_tcl_name "$phase" "$unroll")"
    interface_file="${work_dir}/m_axi_interface_baseline.txt"
  else
    tcl_name="$(manual_hls_tcl_name "$unroll")"
    interface_file="${work_dir}/m_axi_interface.txt"
  fi

  if [ "$DRY_RUN" -eq 1 ]; then
    printf '%-11s %-5s %-24s unroll %-3s %-6s hls=%s/%s/%s cmd=./%s --debug --conda-env %s\n' \
      "$design" "$flow" "$bench" "$unroll" "$phase_tag" "$hls_root" "$hls_bench" "$tcl_name" \
      "$(runner_for_job "$design" "$flow")" "$CONDA_ENV_NAME"
    return 0
  fi

  start_time="$(timestamp)"
  status="PASS"
  : > "$log_file" || return 1

  {
    echo "[$(timestamp)] START: design=${design} benchmark=${bench} hls_bench=${hls_bench} unroll=${unroll} phase=${phase_tag} flow=${flow}"
    echo "[$(timestamp)] WORKDIR: ${work_dir}"
    echo "[$(timestamp)] VIVADO: ${vivado_dir}"
    echo "[$(timestamp)] HLS_TCL: ${hls_root}/${hls_bench}/${tcl_name}"
  } >> "$log_file"

  solution_dir="$(hls_solution_path "$hls_root" "$hls_bench" "$tcl_name")" || status="FAIL"

  if [ "$status" = "PASS" ]; then
    run_hls_if_needed "$hls_root" "$hls_bench" "$tcl_name" "$log_file" || status="FAIL"
  fi

  if [ "$status" = "PASS" ]; then
    prepare_work_dir "$work_dir" >> "$log_file" 2>&1 || status="FAIL"
  fi

  if [ "$status" = "PASS" ]; then
    copy_synthesized_source "$solution_dir" "$work_dir" "$source_copy_name" "$log_file" || status="FAIL"
  fi

  if [ "$status" = "PASS" ]; then
    write_m_axi_interface_file "$source_dir" "$interface_file" "$log_file" || status="FAIL"
  fi

  if [ "$status" = "PASS" ] && [ "$design" = "manual_arch" ]; then
    write_manual_inst_length_file "$hls_bench" "$unroll" "$work_dir" "$log_file" || status="FAIL"
  fi

  if [ "$status" = "PASS" ]; then
    run_archhls_runner "$design" "$flow" "$work_dir" "$vivado_dir" "$source_copy_name" "$log_file" || status="FAIL"
  fi

  end_time="$(timestamp)"
  append_summary "$design" "$bench" "$unroll" "$phase_tag" "$flow" "$status" "$start_time" "$end_time" \
    "$work_dir" "$vivado_dir" "$source_dir" "$log_file" "$summary_file"

  if [ "$status" = "PASS" ]; then
    info "PASS ${design} ${bench} unroll ${unroll} ${phase_tag}"
    return 0
  fi

  info "FAIL ${design} ${bench} unroll ${unroll} ${phase_tag}; see ${log_file}"
  return 1
}

running_job_count() {
  jobs -pr | wc -l | tr -d ' '
}

any_completed_failure() {
  local status_file rc
  for status_file in "$STATUS_DIR"/*.status; do
    [ -e "$status_file" ] || continue
    rc="$(cat "$status_file")"
    if [ "$rc" != "0" ]; then
      return 0
    fi
  done
  return 1
}

wait_for_parallel_slot() {
  while [ "$(running_job_count)" -ge "$PARALLEL_JOBS" ]; do
    sleep 10
    if [ "$KEEP_GOING" -ne 1 ] && any_completed_failure; then
      return 1
    fi
  done

  if [ "$KEEP_GOING" -ne 1 ] && any_completed_failure; then
    return 1
  fi

  return 0
}

run_job_background() {
  local index="$1"
  local design="$2"
  local flow="$3"
  local bench="$4"
  local hls_root="$5"
  local hls_bench="$6"
  local unroll="$7"
  local phase="$8"
  local phase_tag safe_name summary_part status_file

  if [ "$phase" = "manual" ]; then
    phase_tag="manual"
  else
    phase_tag="p${phase}"
  fi

  safe_name="${design}_${bench}_${phase_tag}_unroll_${unroll}"
  summary_part="${SUMMARY_PART_DIR}/$(printf '%03d' "$index")_${safe_name}.csv"
  status_file="${STATUS_DIR}/$(printf '%03d' "$index")_${safe_name}.status"

  (
    run_design_job "$design" "$flow" "$bench" "$hls_root" "$hls_bench" "$unroll" "$phase" "$summary_part"
    local rc=$?
    printf '%s\n' "$rc" > "$status_file"
    exit "$rc"
  ) &
}

count_parallel_failures() {
  local failures=0
  local status_file rc
  for status_file in "$STATUS_DIR"/*.status; do
    [ -e "$status_file" ] || continue
    rc="$(cat "$status_file")"
    if [ "$rc" != "0" ]; then
      failures=$((failures + 1))
    fi
  done
  printf '%s' "$failures"
}

run_or_launch_job() {
  local design="$1"
  local flow="$2"
  local bench="$3"
  local hls_root="$4"
  local hls_bench="$5"
  local unroll="$6"
  local phase="$7"
  local launched_ref="$8"
  local failures_ref="$9"
  local stop_ref="${10}"
  local current_failures current_launched

  if [ "$DRY_RUN" -eq 1 ] || [ "$PARALLEL_JOBS" -eq 1 ]; then
    if ! run_design_job "$design" "$flow" "$bench" "$hls_root" "$hls_bench" "$unroll" "$phase"; then
      current_failures="$(eval "printf '%s' \"\${${failures_ref}}\"")"
      current_failures=$((current_failures + 1))
      eval "${failures_ref}=${current_failures}"
      if [ "$KEEP_GOING" -ne 1 ]; then
        [ "$DRY_RUN" -eq 1 ] || info "Stopping after first failure. Use --keep-going to continue."
        exit 1
      fi
    fi
  else
    if ! wait_for_parallel_slot; then
      eval "${stop_ref}=1"
      return 0
    fi
    current_launched="$(eval "printf '%s' \"\${${launched_ref}}\"")"
    current_launched=$((current_launched + 1))
    eval "${launched_ref}=${current_launched}"
    run_job_background "$current_launched" "$design" "$flow" "$bench" "$hls_root" "$hls_bench" "$unroll" "$phase"
  fi
}

main() {
  local group flow bench hls_bench unrolls unroll phase
  local failures=0 total=0 launched=0 stop_launching=0 reported_total=0
  local baseline_total=0 manual_total=0
  local baseline_done=0 manual_done=0

  preflight_static_files
  preflight_tools
  setup_conda_env || die "failed to set up ${CONDA_ENV_NAME}"

  if [ "$DRY_RUN" -eq 1 ]; then
    info "Dry run: run root would be ${RUN_ROOT}"
    info "Dry run: Vivado projects would be under ${VIVADO_RUN_ROOT}"
    info "Dry run: parallel jobs would be ${PARALLEL_JOBS}"
    info "Dry run: max jobs would be ${MAX_JOBS_LABEL}"
    info "Dry run: max jobs per design would be ${MAX_JOBS_PER_DESIGN_LABEL}"
  else
    if [ -e "$RUN_ROOT" ]; then
      if [ "$FORCE" -eq 1 ]; then
        rm -rf "$RUN_ROOT" || die "failed to remove existing ${RUN_ROOT}"
      else
        die "run directory already exists: ${RUN_ROOT}. Use --force or --run-id."
      fi
    fi
    if [ -e "$VIVADO_RUN_ROOT" ]; then
      if [ "$FORCE" -eq 1 ]; then
        rm -rf "$VIVADO_RUN_ROOT" || die "failed to remove existing ${VIVADO_RUN_ROOT}"
      else
        die "Vivado run directory already exists: ${VIVADO_RUN_ROOT}. Use --force or --run-id."
      fi
    fi
    mkdir -p "$LOG_DIR" "$VIVADO_RUN_ROOT" "$LOCK_DIR" "$STATUS_DIR" "$SUMMARY_PART_DIR" || die "failed to create run directories"
    printf '%s\n' "$SUMMARY_HEADER" > "$SUMMARY_FILE"
    info "Run root: ${RUN_ROOT}"
    info "Vivado root: ${VIVADO_RUN_ROOT}"
    info "Parallel jobs: ${PARALLEL_JOBS}"
    info "Max jobs: ${MAX_JOBS_LABEL}"
    info "Max jobs per design: ${MAX_JOBS_PER_DESIGN_LABEL}"
  fi

  if [ "$ENABLE_BASELINE" -eq 1 ]; then
    for group in "${BASELINE_GROUPS[@]}"; do
      IFS='|' read -r flow bench hls_bench unrolls <<< "$group"
      for unroll in $unrolls; do
        for phase in $BASELINE_PHASES; do
          if [ "$MAX_JOBS_PER_DESIGN" -gt 0 ] && [ "$baseline_total" -ge "$MAX_JOBS_PER_DESIGN" ]; then
            baseline_done=1
            break
          fi
          if [ "$MAX_JOBS" -gt 0 ] && [ "$total" -ge "$MAX_JOBS" ]; then
            stop_launching=1
            break
          fi
          baseline_total=$((baseline_total + 1))
          total=$((total + 1))
          run_or_launch_job "baseline" "$flow" "$bench" "$BASELINE_BENCH_ROOT" "$hls_bench" "$unroll" "$phase" launched failures stop_launching
          [ "$stop_launching" -eq 1 ] && break
        done
        if [ "$stop_launching" -eq 1 ] || [ "$baseline_done" -eq 1 ]; then
          break
        fi
      done
      if [ "$stop_launching" -eq 1 ] || [ "$baseline_done" -eq 1 ]; then
        break
      fi
    done
  fi

  if [ "$stop_launching" -eq 0 ] && [ "$ENABLE_MANUAL_ARCH" -eq 1 ]; then
    for group in "${MANUAL_ARCH_GROUPS[@]}"; do
      IFS='|' read -r flow bench hls_bench unrolls <<< "$group"
      for unroll in $unrolls; do
        if [ "$MAX_JOBS_PER_DESIGN" -gt 0 ] && [ "$manual_total" -ge "$MAX_JOBS_PER_DESIGN" ]; then
          manual_done=1
          break
        fi
        if [ "$MAX_JOBS" -gt 0 ] && [ "$total" -ge "$MAX_JOBS" ]; then
          stop_launching=1
          break
        fi
        manual_total=$((manual_total + 1))
        total=$((total + 1))
        run_or_launch_job "manual_arch" "$flow" "$bench" "$MANUAL_ARCH_ROOT" "$hls_bench" "$unroll" "manual" launched failures stop_launching
        if [ "$stop_launching" -eq 1 ] || [ "$manual_done" -eq 1 ]; then
          break
        fi
      done
      if [ "$stop_launching" -eq 1 ] || [ "$manual_done" -eq 1 ]; then
        break
      fi
    done
  fi

  if [ "$DRY_RUN" -eq 1 ]; then
    info "Dry run complete: ${total} jobs listed."
    return 0
  fi

  if [ "$PARALLEL_JOBS" -gt 1 ]; then
    reported_total="$launched"
    info "Waiting for ${launched} launched jobs to finish."
    wait
    failures="$(count_parallel_failures)"
    merge_parallel_summaries || die "failed to merge parallel summaries"

    if [ "$stop_launching" -eq 1 ] && [ "$KEEP_GOING" -ne 1 ]; then
      info "Stopped launching new jobs after the first completed failure."
    fi
  else
    reported_total="$total"
  fi

  if [ "$failures" -ne 0 ]; then
    info "Completed with ${failures} failed job(s). Summary: ${SUMMARY_FILE}"
    return 1
  fi

  info "All ${reported_total} launched job(s) completed successfully. Summary: ${SUMMARY_FILE}"
}

main "$@"
