#!/usr/bin/env bash
#
# Direct Native Launcher for Need for Speed: Most Wanted (2012)
# Powered by Apple Game Porting Toolkit (D3DMetal) on Apple Silicon
#

export WINEPREFIX="$HOME/.wine_nfsmw2012"
export WINEDEBUG="-all"
export WINEESYNC=1
export WINEMSYNC=1

# Enable Apple Metal Performance HUD (Shows live FPS counter, GPU usage, & frame times)
export MTL_HUD_ENABLED=1

GAME_DIR="$HOME/Downloads/Need-for-Speed-Most-Wanted-AnkerGames/Need for Speed - Most Wanted"
EXE_PATH="$GAME_DIR/NFS13.exe"

if [ ! -f "$EXE_PATH" ]; then
    echo "[!] Error: Game executable not found at $EXE_PATH"
    exit 1
fi

cd "$GAME_DIR"

echo "=========================================================="
echo " Starting Need for Speed: Most Wanted (2012)"
echo " Engine: Chameleon Engine (Criterion Games)"
echo " Graphics: Direct3D 11 -> Apple Metal 4 (D3DMetal)"
echo " Performance Target: 60 - 120 FPS (Liquid Retina XDR)"
echo " Metal HUD: ENABLED (Live FPS display in top-right)"
echo "=========================================================="

exec /opt/homebrew/bin/wine64 "$EXE_PATH"
