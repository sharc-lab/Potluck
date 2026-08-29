# Shared Python environment activation for Potluck run scripts.
#
# Supported command-line options, parsed by potluck_parse_common_args:
#   --conda-env NAME       Activate a Conda environment by name.
#   --conda-prefix PATH    Activate a Conda environment by absolute path.
#   --conda-sh PATH        Source this conda.sh before activation.
#   --no-conda             Use the current shell Python environment.
#
# Supported environment variables:
#   POTLUCK_CONDA_ENV      Conda environment name. Default: INR_pytorch.
#   POTLUCK_CONDA_PREFIX   Absolute path to a Conda environment.
#   POTLUCK_CONDA_SH       Absolute path to conda.sh.
#   POTLUCK_USE_CONDA      Set to 0 to skip Conda activation.

potluck_parse_common_args() {
  POTLUCK_DEBUG=false
  POTLUCK_USE_CONDA="${POTLUCK_USE_CONDA:-1}"
  POTLUCK_CONDA_ENV="${POTLUCK_CONDA_ENV:-INR_pytorch}"
  POTLUCK_CONDA_PREFIX="${POTLUCK_CONDA_PREFIX:-}"
  POTLUCK_CONDA_SH="${POTLUCK_CONDA_SH:-}"
  POTLUCK_REMAINING_ARGS=()

  while [ "$#" -gt 0 ]; do
    case "$1" in
      --debug)
        POTLUCK_DEBUG=true
        shift
        ;;
      --conda-env)
        if [ "$#" -lt 2 ]; then
          echo "Error: --conda-env requires an environment name" >&2
          return 2
        fi
        POTLUCK_CONDA_ENV="$2"
        shift 2
        ;;
      --conda-prefix|--conda-env-prefix)
        if [ "$#" -lt 2 ]; then
          echo "Error: $1 requires an environment path" >&2
          return 2
        fi
        POTLUCK_CONDA_PREFIX="$2"
        shift 2
        ;;
      --conda-sh)
        if [ "$#" -lt 2 ]; then
          echo "Error: --conda-sh requires a path to conda.sh" >&2
          return 2
        fi
        POTLUCK_CONDA_SH="$2"
        shift 2
        ;;
      --no-conda)
        POTLUCK_USE_CONDA=0
        shift
        ;;
      --)
        shift
        while [ "$#" -gt 0 ]; do
          POTLUCK_REMAINING_ARGS+=("$1")
          shift
        done
        ;;
      *)
        POTLUCK_REMAINING_ARGS+=("$1")
        shift
        ;;
    esac
  done
}

potluck_print_env_options() {
  cat >&2 <<'EOF'

Python environment options:
  --conda-env NAME       Activate Conda environment NAME. Default: INR_pytorch.
  --conda-prefix PATH    Activate Conda environment at PATH.
  --conda-sh PATH        Source PATH before running conda activate.
  --no-conda             Use the current shell Python environment.

Equivalent environment variables:
  POTLUCK_CONDA_ENV, POTLUCK_CONDA_PREFIX, POTLUCK_CONDA_SH, POTLUCK_USE_CONDA=0

Examples:
  POTLUCK_CONDA_ENV=my_env ./run_ArchHLS_zcu102.sh ...
  ./run_ArchHLS_zcu102.sh --conda-prefix /path/to/conda/env ...
  conda activate my_env && ./run_ArchHLS_zcu102.sh --no-conda ...
EOF
}

potluck_source_conda() {
  if declare -F conda >/dev/null 2>&1; then
    return 0
  fi

  if command -v conda >/dev/null 2>&1; then
    local conda_setup
    conda_setup="$(conda shell.bash hook 2>/dev/null || true)"
    if [ -n "$conda_setup" ]; then
      eval "$conda_setup"
    fi
  fi

  if declare -F conda >/dev/null 2>&1; then
    return 0
  fi

  local candidates=()
  if [ -n "${POTLUCK_CONDA_SH:-}" ]; then
    candidates+=("$POTLUCK_CONDA_SH")
  fi
  if [ -n "${CONDA_EXE:-}" ]; then
    candidates+=("$(dirname "$(dirname "$CONDA_EXE")")/etc/profile.d/conda.sh")
  fi
  candidates+=(
    "$HOME/miniconda3/etc/profile.d/conda.sh"
    "$HOME/anaconda3/etc/profile.d/conda.sh"
    "/opt/anaconda3/etc/profile.d/conda.sh"
  )

  local conda_sh
  for conda_sh in "${candidates[@]}"; do
    if [ -f "$conda_sh" ]; then
      # shellcheck source=/dev/null
      source "$conda_sh"
      return 0
    fi
  done

  return 1
}

potluck_activate_python_env() {
  if [ "${POTLUCK_USE_CONDA:-1}" = "0" ]; then
    echo "Using current Python environment: $(command -v python)" >&2
    return 0
  fi

  if ! potluck_source_conda; then
    if [ -n "${POTLUCK_CONDA_PREFIX:-}" ] && [ -x "$POTLUCK_CONDA_PREFIX/bin/python" ]; then
      export PATH="$POTLUCK_CONDA_PREFIX/bin:$PATH"
      export CONDA_PREFIX="$POTLUCK_CONDA_PREFIX"
      echo "Using Python environment prefix without conda shell hook: $POTLUCK_CONDA_PREFIX" >&2
      return 0
    fi

    echo "Error: conda.sh not found." >&2
    echo "Set POTLUCK_CONDA_SH=/path/to/conda.sh, use --conda-sh /path/to/conda.sh, or run with --no-conda after activating your environment." >&2
    return 1
  fi

  if [ -n "${POTLUCK_CONDA_PREFIX:-}" ]; then
    conda activate "$POTLUCK_CONDA_PREFIX"
  else
    conda activate "$POTLUCK_CONDA_ENV"
  fi

  echo "Activated Python environment: $(python -c 'import sys; print(sys.executable)')" >&2
}
