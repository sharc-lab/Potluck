#  ArchHLS: Next Generation of High-Level Synthesis for Agile Architectural Design

## Introduction
This repo is the implementation of the first version of ArchHLS, focusing on unified architecture generation based on user provided HLS C/C++ accelerator designs. ArchHLS is currently built on top of AMD Vitis HLS, targeting at FPGA flow. We are working on to make it compatiable with other HLS tools and targeting at ASIC flows. 

## ArchHLS Inputs:
Multiple C/C++ HLS accelerator designs with shared functional modules. Needed to be synthesized first using Vitis HLS.

## ArchHLS Outputs:
1. A packaged IP of the unified architecture design (RTL).
2. Instruction binary compiled from user input HLS accelerator designs to map them on the unified architecture.

## ArchHLS Benefits:
1. Much shorter compile time: It takes only several seconds to finsih the unified architecture generation and only need to do placement and routing to generate the bitstream once. No need to generate bitstream for each of the accelerator design separately.
2. Avoid run-time re-programming: Simply change the instructions to implement different accelerator dataflows. Only takes several clock cycles to load these instructions, instead of waiting for several seconds to re-program FPGA using a new bitstream.
3. Save on-board resources: The unified hardware architecture saves a lot of on-board resources because there are a lot of redundant functional modules in the HLS accelerator designs, especially ML accelerators.
4. Negliable overhead: The unified architecture control logic is super lightweight, without the need to consume a lot of FPGA resources. The instruction loading and decoding can be finished only a few clock cycles, and can be overlapped with the computation, with negiliable extra clock cycles.

## Python Environment Selection

Install the Python packages from the artifact root:

```bash
conda activate Potluck_env
python -m pip install -r requirements.txt
```

The artifact runner creates and uses `Potluck_env`. The `run_ArchHLS*.sh`
scripts still allow users to override the Conda environment without editing the
scripts:

```bash
# Activate by Conda environment name.
POTLUCK_CONDA_ENV=my_env ./run_ArchHLS_zcu102.sh ...
./run_ArchHLS_zcu102.sh --conda-env my_env ...

# Activate by Conda environment path.
POTLUCK_CONDA_PREFIX=/path/to/conda/env ./run_ArchHLS_zcu102.sh ...
./run_ArchHLS_zcu102.sh --conda-prefix /path/to/conda/env ...

# Use a non-standard conda.sh location.
POTLUCK_CONDA_SH=/path/to/conda.sh ./run_ArchHLS_zcu102.sh ...
./run_ArchHLS_zcu102.sh --conda-sh /path/to/conda.sh ...

# Use the already-active Python environment.
conda activate my_env
./run_ArchHLS_zcu102.sh --no-conda ...
```

The same options work for all `run_ArchHLS*.sh` entrypoints.
