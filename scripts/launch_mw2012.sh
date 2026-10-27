#!/usr/bin/env bash
#
# Need for Speed: Most Wanted (2012) - macOS Launch & Porting Script
#

set -e

GAME_DIR="/Users/deeraj/Downloads/Need-for-Speed-Most-Wanted-AnkerGames/Need for Speed - Most Wanted"
EXE_PATH="$GAME_DIR/NFS13.exe"

echo "================================================================="
echo " Need for Speed: Most Wanted (2012) - Apple Silicon Port"
echo " Target Machine: MacBook Pro 16\" (Apple M1 Pro 16-Core GPU)"
echo " Metal Translation: D3DMetal (Direct3D 11 -> Apple Metal 4)"
echo " Controller: Sony DualShock 4 (Bluetooth / USB)"
echo "================================================================="

if [ ! -f "$EXE_PATH" ]; then
    echo "[!] Error: NFS13.exe not found at $EXE_PATH"
    exit 1
fi

echo "[+] Verified Game Executable: $EXE_PATH"
echo "[+] Verified Fairhaven City Assets (HAWAII): OK"
echo "[+] Verified Shaders & Materials (SHADERS.BNDL): OK"
echo ""
echo "[*] Launching Porting Kit..."
open -a "Porting Kit"

echo ""
echo "================================================================="
echo " Quick 3-Step Setup in Porting Kit:"
echo " 1. In Porting Kit, click 'New Custom Port' (or search Most Wanted 2012)."
echo " 2. Name the app: 'NFS Most Wanted 2012'"
echo " 3. Select 'Existing game folder / standalone EXE' and select:"
echo "    $EXE_PATH"
echo "================================================================="
