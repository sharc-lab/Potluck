#!/usr/bin/env bash
set -uo pipefail

CONDA_ENV_NAME="Potluck_env"
SOURCE_CORE="Potluck_Final"
BENCH_ROOT="Potluck_Benchmark"
RUN_ROOT_BASE="Potluck_AE_Runs"
VIVADO_ROOT_BASE="Vivado_project"

DRY_RUN=0
KEEP_GOING=0
FORCE=0
PARALLEL_JOBS=1
RUN_ID="${POTLUCK_AE_RUN_ID:-$(date +%Y%m%d_%H%M%S)}"

EXPERIMENT_GROUPS=(
  "normal|DNN_block|1 4 8"
  "normal|attention_module|1 4 32"
  "normal|conv_act|1 4 16"
  "normal|moe_layer|1 4 32"
  "normal|streaming_bench_1|1 4 32"
  "normal|streaming_bench_2|16 32 64"
  "high|high_frequency_bench_1|4 16 64"
  "high|high_frequency_bench_2|4 32 64"
)

usage() {
  cat <<'EOF'
Usage: ./run_all_potluck_zcu102_experiments.sh [options]

Runs all 24 Potluck ZCU102 artifact-evaluation experiments.

Options:
  --dry-run       Print the experiment plan without creating files or running tools.
  --keep-going    Continue after a failed experiment and record failures in summary.csv.
  --force         Remove an existing run directory with the selected run id.
  -j, --jobs N    Run up to N benchmark/unroll experiments in parallel. Default: 1.
  --run-id NAME   Use Potluck_AE_Runs/NAME instead of a timestamp.
  -h, --help      Show this help.

The script creates and installs Conda environment Potluck_env only when it
does not already exist. If Potluck_env exists, dependency installation is
skipped.

Each benchmark/unroll experiment still runs its own P1/P2/P3 HLS preparation
steps sequentially. The --jobs value controls how many complete experiments run
at the same time.

All ArchHLS invocations use --debug, so the normal and high-frequency flows use
the DRAM debug bitstream-generation Tcl scripts.
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
  info "Interrupted; stopping active experiments."
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
    --run-id)
      [ "$#" -ge 2 ] || die "--run-id requires a value"
      RUN_ID="$2"
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

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR" || exit 1

RUN_ROOT="${RUN_ROOT_BASE}/${RUN_ID}"
VIVADO_RUN_ROOT="${VIVADO_ROOT_BASE}/${RUN_ID}"
LOG_DIR="${RUN_ROOT}/logs"
LOCK_DIR="${RUN_ROOT}/locks"
STATUS_DIR="${RUN_ROOT}/status"
SUMMARY_PART_DIR="${RUN_ROOT}/summary_parts"
SUMMARY_FILE="${RUN_ROOT}/summary.csv"
SUMMARY_HEADER="benchmark,unroll,flow,status,start_time,end_time,workdir,vivado_root,log_path"

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

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

axi_file_for_bench() {
  local bench="$1"
  printf 'axi_interface_mapping_%s.json' "$bench"
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

preflight_static_files() {
  [ -d "$SOURCE_CORE" ] || die "missing ${SOURCE_CORE}"
  [ -d "$BENCH_ROOT" ] || die "missing ${BENCH_ROOT}"
  [ -f "requirements.txt" ] || die "missing requirements.txt in artifact root"
  [ -x "${SOURCE_CORE}/run_ArchHLS_zcu102.sh" ] || die "missing executable ${SOURCE_CORE}/run_ArchHLS_zcu102.sh"
  [ -x "${SOURCE_CORE}/run_ArchHLS_zcu102_high_frequency.sh" ] || die "missing executable ${SOURCE_CORE}/run_ArchHLS_zcu102_high_frequency.sh"
  [ -f "${SOURCE_CORE}/generate_bitstream_dram_debug.tcl" ] || die "missing normal-frequency debug Tcl in ${SOURCE_CORE}"
  [ -f "${SOURCE_CORE}/generate_bitstream_dram_debug_250_mhz.tcl" ] || die "missing high-frequency debug Tcl in ${SOURCE_CORE}"

  local group flow bench unrolls unroll p
  local axi_file
  for group in "${EXPERIMENT_GROUPS[@]}"; do
    IFS='|' read -r flow bench unrolls <<< "$group"
    [ -d "${BENCH_ROOT}/${bench}" ] || die "missing benchmark directory ${BENCH_ROOT}/${bench}"
    [ -f "${SOURCE_CORE}/BRAM_name_${bench}.json" ] || die "missing ${SOURCE_CORE}/BRAM_name_${bench}.json"
    axi_file="$(axi_file_for_bench "$bench")"
    [ -f "${SOURCE_CORE}/${axi_file}" ] || die "missing ${SOURCE_CORE}/${axi_file}"
    for unroll in $unrolls; do
      for p in 1 2 3; do
        [ -f "${BENCH_ROOT}/${bench}/run_hls_p${p}_unroll_${unroll}.tcl" ] || \
          die "missing ${BENCH_ROOT}/${bench}/run_hls_p${p}_unroll_${unroll}.tcl"
      done
    done
  done
}

preflight_tools() {
  [ "$DRY_RUN" -eq 1 ] && return 0
  command_exists vivado || die "vivado is not available in PATH"
  command_exists vitis_hls || die "vitis_hls is not available in PATH"
}

project_name_from_tcl() {
  local tcl_file="$1"
  awk '/^[[:space:]]*open_project[[:space:]]/ {print $NF; exit}' "$tcl_file"
}

hls_solution_path() {
  local bench="$1"
  local unroll="$2"
  local program="$3"
  local tcl_file="${BENCH_ROOT}/${bench}/run_hls_p${program}_unroll_${unroll}.tcl"
  local project
  project="$(project_name_from_tcl "$tcl_file")"
  [ -n "$project" ] || return 1
  printf '%s/%s/%s/solution1' "$BENCH_ROOT" "$bench" "$project"
}

ensure_impl_verilog_tree() {
  local solution_dir="$1"
  local log_file="$2"
  local syn_dir="${solution_dir}/syn/verilog"
  local impl_dir="${solution_dir}/impl/verilog"

  if [ -f "${impl_dir}/top.v" ]; then
    return 0
  fi

  if [ -f "${syn_dir}/top.v" ]; then
    {
      echo "[$(timestamp)] INFO: ${impl_dir}/top.v is missing; copying ${syn_dir} to ${impl_dir} for ArchHLS."
      mkdir -p "$impl_dir"
      cp -a "${syn_dir}/." "$impl_dir/"
    } >> "$log_file" 2>&1
    return $?
  fi

  return 1
}

validate_hls_solution() {
  local solution_dir="$1"
  local log_file="$2"

  ensure_impl_verilog_tree "$solution_dir" "$log_file" || return 1
  [ -f "${solution_dir}/.autopilot/db/design.bindinfo.xml" ] || return 1
  [ -f "${solution_dir}/.autopilot/db/top.adb.xml" ] || return 1
  [ -f "${solution_dir}/impl/verilog/top.v" ] || return 1
}

acquire_benchmark_hls_lock() {
  local bench="$1"
  local log_file="$2"
  local lock_path="${LOCK_DIR}/hls_${bench}.lock"

  mkdir -p "$LOCK_DIR" || return 1
  while ! mkdir "$lock_path" 2>/dev/null; do
    echo "[$(timestamp)] INFO: waiting for HLS lock ${lock_path}" >> "$log_file"
    sleep 30
  done
}

release_benchmark_hls_lock() {
  local bench="$1"
  local lock_path="${LOCK_DIR}/hls_${bench}.lock"
  rmdir "$lock_path" 2>/dev/null || true
}

run_hls_if_needed() {
  local bench="$1"
  local unroll="$2"
  local program="$3"
  local log_file="$4"
  local solution_dir tcl_name

  solution_dir="$(hls_solution_path "$bench" "$unroll" "$program")" || return 1
  tcl_name="run_hls_p${program}_unroll_${unroll}.tcl"

  if validate_hls_solution "$solution_dir" "$log_file"; then
    echo "[$(timestamp)] INFO: HLS P${program} already prepared at ${solution_dir}" >> "$log_file"
    return 0
  fi

  acquire_benchmark_hls_lock "$bench" "$log_file" || return 1

  if validate_hls_solution "$solution_dir" "$log_file"; then
    echo "[$(timestamp)] INFO: HLS P${program} was prepared by another job at ${solution_dir}" >> "$log_file"
    release_benchmark_hls_lock "$bench"
    return 0
  fi

  echo "[$(timestamp)] CMD: (cd ${BENCH_ROOT}/${bench} && vitis_hls -f ${tcl_name})" | tee -a "$log_file"
  (cd "${BENCH_ROOT}/${bench}" && vitis_hls -f "$tcl_name") >> "$log_file" 2>&1
  local rc=$?
  echo "[$(timestamp)] EXIT: ${rc}" >> "$log_file"
  if [ "$rc" -ne 0 ]; then
    release_benchmark_hls_lock "$bench"
    return "$rc"
  fi

  validate_hls_solution "$solution_dir" "$log_file" || {
    echo "[$(timestamp)] ERROR: HLS output is incomplete for ${solution_dir}" >> "$log_file"
    echo "[$(timestamp)] ERROR: expected .autopilot/db/design.bindinfo.xml, .autopilot/db/top.adb.xml, and impl/verilog/top.v" >> "$log_file"
    release_benchmark_hls_lock "$bench"
    return 1
  }

  release_benchmark_hls_lock "$bench"
}

write_hls_path_file() {
  local bench="$1"
  local unroll="$2"
  local work_dir="$3"
  local hls_file="${work_dir}/HLS_project_solution_path_${bench}_unroll_${unroll}.txt"
  local p solution_dir project

  : > "$hls_file" || return 1
  for p in 1 2 3; do
    solution_dir="$(hls_solution_path "$bench" "$unroll" "$p")" || return 1
    project="$(basename "$(dirname "$solution_dir")")"
    printf '../../../%s/%s/%s/solution1/\n' "$BENCH_ROOT" "$bench" "$project" >> "$hls_file"
  done
}

prepare_work_dir() {
  local bench="$1"
  local unroll="$2"
  local work_dir="$3"

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
  write_hls_path_file "$bench" "$unroll" "$work_dir"
}

run_archhls() {
  local flow="$1"
  local bench="$2"
  local unroll="$3"
  local work_dir="$4"
  local vivado_dir="$5"
  local log_file="$6"
  local hls_file="HLS_project_solution_path_${bench}_unroll_${unroll}.txt"
  local bram_file="BRAM_name_${bench}.json"
  local axi_file
  local runner="run_ArchHLS_zcu102.sh"
  local vivado_arg="../../../${VIVADO_ROOT_BASE}/${RUN_ID}/${bench}_unroll_${unroll}"
  local -a cmd

  axi_file="$(axi_file_for_bench "$bench")"

  if [ "$flow" = "high" ]; then
    runner="run_ArchHLS_zcu102_high_frequency.sh"
    cmd=(bash "./${runner}" --debug --conda-env "$CONDA_ENV_NAME" "$vivado_arg" "$hls_file" "$bram_file" "$axi_file")
  else
    cmd=(bash "./${runner}" --debug --conda-env "$CONDA_ENV_NAME" "$vivado_arg" "$hls_file" "$bram_file" "$axi_file")
  fi

  mkdir -p "$vivado_dir" || return 1
  echo "[$(timestamp)] CMD: (cd ${work_dir} && ${cmd[*]})" | tee -a "$log_file"
  (cd "$work_dir" && "${cmd[@]}") >> "$log_file" 2>&1
  local rc=$?
  echo "[$(timestamp)] EXIT: ${rc}" >> "$log_file"
  return "$rc"
}

append_summary() {
  local bench="$1"
  local unroll="$2"
  local flow="$3"
  local status="$4"
  local start_time="$5"
  local end_time="$6"
  local work_dir="$7"
  local vivado_dir="$8"
  local log_file="$9"
  local summary_file="${10:-$SUMMARY_FILE}"

  printf '%s,%s,%s,%s,%s,%s,%s,%s,%s\n' \
    "$bench" "$unroll" "$flow" "$status" "$start_time" "$end_time" "$work_dir" "$vivado_dir" "$log_file" \
    >> "$summary_file"
}

run_experiment() {
  local flow="$1"
  local bench="$2"
  local unroll="$3"
  local work_dir="${RUN_ROOT}/Potluck_Final_${bench}_unroll_${unroll}"
  local vivado_dir="${VIVADO_RUN_ROOT}/${bench}_unroll_${unroll}"
  local log_file="${LOG_DIR}/${bench}_unroll_${unroll}.log"
  local summary_file="${4:-$SUMMARY_FILE}"
  local start_time end_time status p

  if [ "$DRY_RUN" -eq 1 ]; then
    if [ "$flow" = "high" ]; then
      printf 'HIGH   %-24s unroll %-3s workdir=%s cmd=./run_ArchHLS_zcu102_high_frequency.sh --debug --conda-env %s\n' \
        "$bench" "$unroll" "$work_dir" "$CONDA_ENV_NAME"
    else
      printf 'NORMAL %-24s unroll %-3s workdir=%s cmd=./run_ArchHLS_zcu102.sh --debug --conda-env %s\n' \
        "$bench" "$unroll" "$work_dir" "$CONDA_ENV_NAME"
    fi
    return 0
  fi

  start_time="$(timestamp)"
  status="PASS"
  : > "$log_file" || return 1

  {
    echo "[$(timestamp)] START: benchmark=${bench} unroll=${unroll} flow=${flow}"
    echo "[$(timestamp)] WORKDIR: ${work_dir}"
    echo "[$(timestamp)] VIVADO: ${vivado_dir}"
  } >> "$log_file"

  prepare_work_dir "$bench" "$unroll" "$work_dir" >> "$log_file" 2>&1 || status="FAIL"

  if [ "$status" = "PASS" ]; then
    for p in 1 2 3; do
      run_hls_if_needed "$bench" "$unroll" "$p" "$log_file" || {
        status="FAIL"
        break
      }
    done
  fi

  if [ "$status" = "PASS" ]; then
    run_archhls "$flow" "$bench" "$unroll" "$work_dir" "$vivado_dir" "$log_file" || status="FAIL"
  fi

  end_time="$(timestamp)"
  append_summary "$bench" "$unroll" "$flow" "$status" "$start_time" "$end_time" "$work_dir" "$vivado_dir" "$log_file" "$summary_file"

  if [ "$status" = "PASS" ]; then
    info "PASS ${bench} unroll ${unroll}"
    return 0
  fi

  info "FAIL ${bench} unroll ${unroll}; see ${log_file}"
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

run_experiment_background() {
  local index="$1"
  local flow="$2"
  local bench="$3"
  local unroll="$4"
  local safe_name="${bench}_unroll_${unroll}"
  local summary_part="${SUMMARY_PART_DIR}/$(printf '%03d' "$index")_${safe_name}.csv"
  local status_file="${STATUS_DIR}/$(printf '%03d' "$index")_${safe_name}.status"

  (
    run_experiment "$flow" "$bench" "$unroll" "$summary_part"
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

main() {
  local group flow bench unrolls unroll failures=0 total=0
  local launched=0 reported_total=0
  local stop_launching=0

  preflight_static_files
  preflight_tools
  setup_conda_env || die "failed to set up ${CONDA_ENV_NAME}"

  if [ "$DRY_RUN" -eq 1 ]; then
    info "Dry run: run root would be ${RUN_ROOT}"
    info "Dry run: Vivado projects would be under ${VIVADO_RUN_ROOT}"
    info "Dry run: parallel jobs would be ${PARALLEL_JOBS}"
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
  fi

  for group in "${EXPERIMENT_GROUPS[@]}"; do
    IFS='|' read -r flow bench unrolls <<< "$group"
    for unroll in $unrolls; do
      total=$((total + 1))
      if [ "$DRY_RUN" -eq 1 ] || [ "$PARALLEL_JOBS" -eq 1 ]; then
        if ! run_experiment "$flow" "$bench" "$unroll"; then
          failures=$((failures + 1))
          if [ "$KEEP_GOING" -ne 1 ]; then
            [ "$DRY_RUN" -eq 1 ] || info "Stopping after first failure. Use --keep-going to continue."
            exit 1
          fi
        fi
      else
        if ! wait_for_parallel_slot; then
          stop_launching=1
          break
        fi
        launched=$((launched + 1))
        run_experiment_background "$launched" "$flow" "$bench" "$unroll"
      fi
    done
    [ "$stop_launching" -eq 1 ] && break
  done

  if [ "$DRY_RUN" -eq 1 ]; then
    info "Dry run complete: ${total} experiments listed."
    return 0
  fi

  if [ "$PARALLEL_JOBS" -gt 1 ]; then
    wait || true
    merge_parallel_summaries
    failures="$(count_parallel_failures)"
    reported_total="$launched"
    if [ "$stop_launching" -eq 1 ]; then
      info "Stopped launching new experiments after a failure. Already-started jobs were allowed to finish."
    fi
  else
    reported_total="$total"
  fi

  info "Complete: $((reported_total - failures))/${reported_total} experiments passed."
  info "Summary: ${SUMMARY_FILE}"
  [ "$failures" -eq 0 ]
}

main "$@"
