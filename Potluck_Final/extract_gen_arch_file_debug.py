#!/usr/bin/env python3
import os
import sys
import shutil

def main():
    # Check for correct usage
    if len(sys.argv) != 2:
        print(f"Usage: {sys.argv[0]} <vivado_project_root>", file=sys.stderr)
        sys.exit(1)

    proj_root = sys.argv[1]
    # Normalize path (remove trailing slash if any)
    proj_root = proj_root.rstrip("/")

    # Create FPGA_deploy directory under current working directory
    deploy_dir = os.path.join(os.getcwd(), "FPGA_deploy")
    os.makedirs(deploy_dir, exist_ok=True)

    # Define source and destination paths
    src_bit = os.path.join(
        proj_root,
        "automatic_gen_bitstream_debug",
        "automatic_gen_bitstream.runs",
        "impl_1",
        "design_1_wrapper.bit"
    )
    dst_bit = os.path.join(deploy_dir, "gen_architecture.bit")

    src_hwh = os.path.join(
        proj_root,
        "automatic_gen_bitstream_debug",
        "automatic_gen_bitstream.gen",
        "sources_1",
        "bd",
        "design_1",
        "hw_handoff",
        "design_1.hwh"
    )
    dst_hwh = os.path.join(deploy_dir, "gen_architecture.hwh")

    # Verify source files exist
    for src in (src_bit, src_hwh):
        if not os.path.isfile(src):
            print(f"Error: source file not found: {src}", file=sys.stderr)
            sys.exit(1)

    # Copy and rename
    shutil.copyfile(src_bit, dst_bit)
    shutil.copyfile(src_hwh, dst_hwh)

    print(f"✅ Copied bitstream to {dst_bit}")
    print(f"✅ Copied HWH file to {dst_hwh}")

if __name__ == "__main__":
    main()
