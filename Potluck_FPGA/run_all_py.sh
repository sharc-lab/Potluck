#!/usr/bin/env bash
set -uo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PYTHON_BIN="${PYTHON:-python}"
RUN_ID="$(date +%Y%m%d_%H%M%S)"
LOG_ROOT="${ROOT_DIR}/run_logs"
DRY_RUN=0
FAIL_FAST=0
VERBOSE=0
SCRIPT_ARGS=()

usage() {
  cat <<EOF
Usage: ./run_all_py.sh [options] [-- args-for-each-python-script]

Runs every .py file under:
  ${ROOT_DIR}

Options:
  --dry-run        Print the scripts that would be run, without running them.
  --fail-fast      Stop at the first failing Python script.
  --logs-dir DIR   Write logs under DIR/RUN_ID instead of ${LOG_ROOT}/RUN_ID.
  --python PATH    Python executable to use. Default: \$PYTHON or python.
  --run-id NAME    Use NAME as the log subdirectory. Default: timestamp.
  --verbose        Stream each script's output to the terminal and the log.
  -h, --help       Show this help.

Environment:
  PYTHON=/path/to/python ./run_all_py.sh

By default, the runner continues after failures so all scripts are attempted.
It exits nonzero if any script fails.
EOF
}

timestamp() {
  date +%Y-%m-%dT%H:%M:%S%z
}

die() {
  echo "ERROR: $*" >&2
  exit 1
}

while [ "$#" -gt 0 ]; do
  case "$1" in
    --dry-run)
      DRY_RUN=1
      shift
      ;;
    --fail-fast)
      FAIL_FAST=1
      shift
      ;;
    --logs-dir)
      [ "$#" -ge 2 ] || die "--logs-dir requires a directory"
      LOG_ROOT="$2"
      shift 2
      ;;
    --python)
      [ "$#" -ge 2 ] || die "--python requires an executable path"
      PYTHON_BIN="$2"
      shift 2
      ;;
    --run-id)
      [ "$#" -ge 2 ] || die "--run-id requires a value"
      RUN_ID="$2"
      shift 2
      ;;
    --verbose)
      VERBOSE=1
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    --)
      shift
      while [ "$#" -gt 0 ]; do
        SCRIPT_ARGS+=("$1")
        shift
      done
      ;;
    *)
      die "unknown option: $1"
      ;;
  esac
done

if [ ! -d "$ROOT_DIR" ]; then
  die "root directory does not exist: $ROOT_DIR"
fi

if [ "$DRY_RUN" -eq 0 ] && ! command -v "$PYTHON_BIN" >/dev/null 2>&1; then
  die "python executable not found: $PYTHON_BIN"
fi

mapfile -d '' PY_FILES < <(
  find "$ROOT_DIR" \
    -path "${LOG_ROOT}" -prune -o \
    -type f -name '*.py' -print0 |
  sort -z -V
)

TOTAL="${#PY_FILES[@]}"
[ "$TOTAL" -gt 0 ] || die "no .py files found under $ROOT_DIR"

LOG_DIR="${LOG_ROOT}/${RUN_ID}"
SUMMARY_FILE="${LOG_DIR}/summary.tsv"

if [ "$DRY_RUN" -eq 0 ]; then
  mkdir -p "$LOG_DIR" || die "failed to create log directory: $LOG_DIR"
  printf 'status\tseconds\tscript\tlog\n' > "$SUMMARY_FILE" || die "failed to write summary: $SUMMARY_FILE"
fi

echo "[$(timestamp)] Found ${TOTAL} Python scripts under ${ROOT_DIR}"
if [ "$DRY_RUN" -eq 0 ]; then
  echo "[$(timestamp)] Logs: ${LOG_DIR}"
fi

PASS_COUNT=0
FAIL_COUNT=0

for idx in "${!PY_FILES[@]}"; do
  script="${PY_FILES[$idx]}"
  rel="${script#${ROOT_DIR}/}"
  script_dir="$(dirname "$script")"
  script_name="$(basename "$script")"
  display_index=$((idx + 1))

  if [ "$DRY_RUN" -eq 1 ]; then
    printf '[%d/%d] cd %q && %q %q' "$display_index" "$TOTAL" "$script_dir" "$PYTHON_BIN" "$script_name"
    if [ "${#SCRIPT_ARGS[@]}" -gt 0 ]; then
      printf ' %q' "${SCRIPT_ARGS[@]}"
    fi
    printf '\n'
    continue
  fi

  safe_rel="${rel//\//__}"
  safe_rel="${safe_rel// /_}"
  log_path="${LOG_DIR}/${display_index}_${safe_rel%.py}.log"

  echo "[$(timestamp)] [${display_index}/${TOTAL}] START ${rel}"
  start_time="$(date +%s)"

  if [ "$VERBOSE" -eq 1 ]; then
    (
      cd "$script_dir" &&
      "$PYTHON_BIN" "$script_name" "${SCRIPT_ARGS[@]}"
    ) 2>&1 | tee "$log_path"
    rc="${PIPESTATUS[0]}"
  else
    (
      cd "$script_dir" &&
      "$PYTHON_BIN" "$script_name" "${SCRIPT_ARGS[@]}"
    ) >"$log_path" 2>&1
    rc="$?"
  fi

  end_time="$(date +%s)"
  elapsed=$((end_time - start_time))

  if [ "$rc" -eq 0 ]; then
    PASS_COUNT=$((PASS_COUNT + 1))
    printf 'PASS\t%d\t%s\t%s\n' "$elapsed" "$rel" "$log_path" >> "$SUMMARY_FILE"
    echo "[$(timestamp)] [${display_index}/${TOTAL}] PASS ${rel} (${elapsed}s)"
  else
    FAIL_COUNT=$((FAIL_COUNT + 1))
    printf 'FAIL(%d)\t%d\t%s\t%s\n' "$rc" "$elapsed" "$rel" "$log_path" >> "$SUMMARY_FILE"
    echo "[$(timestamp)] [${display_index}/${TOTAL}] FAIL ${rel} rc=${rc} (${elapsed}s); log: ${log_path}" >&2
    if [ "$FAIL_FAST" -eq 1 ]; then
      break
    fi
  fi
done

if [ "$DRY_RUN" -eq 1 ]; then
  echo "[$(timestamp)] Dry run complete."
  exit 0
fi

echo "[$(timestamp)] Complete. Passed: ${PASS_COUNT}; failed: ${FAIL_COUNT}; summary: ${SUMMARY_FILE}"

if [ "$FAIL_COUNT" -gt 0 ]; then
  exit 1
fi

exit 0
