#!/usr/bin/env python3
"""
Asset Verification Suite for Need for Speed: Most Wanted (2012) - Chameleon Engine
"""

import os
import sys
from pathlib import Path

REQUIRED_DIRECTORIES = [
    "Core",
    "GAMELOGIC",
    "HAWAII",
    "PHYSICS",
    "SOUND",
    "UI",
    "VEHICLES"
]

ESSENTIAL_BUNDLE_FILES = [
    "CAMERAS.BNDL",
    "GLOBALCONFIG.BNDL",
    "GLOBALEFFECTS.BNDL",
    "GLOBALMATERIALDICTIONARY.BNDL",
    "GLOBALTEXTUREDICTIONARY.BNDL",
    "POSTFX.BNDL",
    "SHADERS.BNDL",
    "WORLDLIST.BNDL"
]

def verify_mw2012_assets(game_dir: Path):
    print(f"[*] Validating Criterion Chameleon Engine assets in:\n    {game_dir}\n")

    if not game_dir.exists() or not game_dir.is_dir():
        print(f"[!] Error: Directory '{game_dir}' not found.")
        return False

    all_passed = True

    # 1. Check Executable
    exe_path = game_dir / "NFS13.exe"
    if exe_path.exists():
        size_mb = exe_path.stat().st_size / (1024 * 1024)
        print(f"[+] Found NFS13.exe executable ({size_mb:.2f} MB).")
    else:
        print("[!] ERROR: NFS13.exe missing in game directory!")
        all_passed = False

    # 2. Check Core Subsystem Directories
    print("\n[*] Checking engine subsystems...")
    for d in REQUIRED_DIRECTORIES:
        p = game_dir / d
        if p.exists() and p.is_dir():
            count = len(os.listdir(p))
            print(f"  [+] {d:<12} : Verified ({count} items)")
        else:
            print(f"  [-] {d:<12} : MISSING!")
            all_passed = False

    # 3. Check Critical .BNDL Asset Containers
    print("\n[*] Checking Direct3D 11 & Chameleon .BNDL containers...")
    for bndl in ESSENTIAL_BUNDLE_FILES:
        p = game_dir / bndl
        if p.exists() and p.is_file():
            size_kb = p.stat().st_size / 1024
            print(f"  [+] {bndl:<30} : Verified ({size_kb:8.1f} KB)")
        else:
            print(f"  [-] {bndl:<30} : MISSING!")
            all_passed = False

    print("\n" + "=" * 60)
    if all_passed:
        print("[SUCCESS] All Need for Speed: Most Wanted (2012) assets verified!")
        print("          Ready for macOS Apple Silicon D3DMetal execution.")
    else:
        print("[FAILURE] Some required files or directories are missing.")
    print("=" * 60)

    return all_passed

if __name__ == "__main__":
    default_dir = Path("/Users/deeraj/Downloads/Need-for-Speed-Most-Wanted-AnkerGames/Need for Speed - Most Wanted")
    target = Path(sys.argv[1]) if len(sys.argv) > 1 else default_dir
    success = verify_mw2012_assets(target)
    sys.exit(0 if success else 1)
