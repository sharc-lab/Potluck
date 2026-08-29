
import sys
from pathlib import Path
from pynq.pl_server import hwh_parser, embedded_device

def main():
    # Fixed input and output paths
    deploy_dir = Path.cwd() / "FPGA_deploy"
    hwh_path = deploy_dir / "gen_architecture.hwh"
    xclbin_path = deploy_dir / "gen_architecture.xclbin"

    # Check that the HWH file exists
    if not hwh_path.is_file():
        print(f"Error: HWH file not found at {hwh_path}", file=sys.stderr)
        sys.exit(1)

    # Read, parse, and convert to .xclbin
    hwh_data = hwh_path.read_text()
    hwh = hwh_parser._HWHUltrascale(hwh_data=hwh_data)
    xclbin_data = embedded_device._create_xclbin(hwh.mem_dict)

    # Write out the .xclbin
    xclbin_path.write_bytes(xclbin_data)
    print(f"✅ Wrote xclbin to {xclbin_path}")

if __name__ == "__main__":
    main()
