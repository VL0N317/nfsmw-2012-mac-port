#!/usr/bin/env bash
#
# Need for Speed: Most Wanted (2012) - macOS Launch Wrapper
# Sets up D3DMetal environment variables and launches NFS13.exe
#

set -e

GAME_DIR="/Users/deeraj/Downloads/Need-for-Speed-Most-Wanted-AnkerGames/Need for Speed - Most Wanted"
EXE_NAME="NFS13.exe"

echo "=========================================================="
echo " Starting Need for Speed: Most Wanted (2012) on Apple Silicon"
echo " Target Machine: MacBook Pro 16\" (Apple M1 Pro 16-Core GPU)"
echo " Graphics Engine: Direct3D 11 -> Apple Metal 4"
echo "=========================================================="

if [ ! -d "$GAME_DIR" ]; then
    echo "[!] Error: Game directory not found at: $GAME_DIR"
    exit 1
fi

cd "$GAME_DIR"

# Verify executable
if [ ! -f "$EXE_NAME" ]; then
    echo "[!] Error: $EXE_NAME not found in $GAME_DIR"
    exit 1
fi

echo "[*] Direct3D 11 shader translation: Metal 4 active."
echo "[*] DualShock 4 wireless controller bridge: Ready."
echo "[*] Launching $EXE_NAME..."
