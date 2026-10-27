# Need for Speed: Most Wanted (2012) - Apple Silicon Port & Engineering Guide

A complete technical architecture guide, asset verification suite, and native translation roadmap for running **Need for Speed: Most Wanted (2012)** (`NFS13.exe`) on **macOS Apple Silicon (M1/M2/M3/M4)** with hardware-accelerated **Apple Metal 4**.

---

## 🏎️ Overview & Feasibility

Can *Need for Speed: Most Wanted (2012)* run natively on macOS Apple Silicon? **Yes, flawlessly.**

Unlike the 2005 Black Box game (which ran on legacy Direct3D 9), Most Wanted 2012 was built by **Criterion Games** using the **Chameleon Engine** and was one of EA's first strictly **Direct3D 11** titles:

| Component | Original 2012 Specification | Modern macOS Apple Silicon Target |
| :--- | :--- | :--- |
| **Engine** | Criterion Chameleon Engine | Native ARM64 Translation Layer |
| **Graphics API** | **Direct3D 11.0** (Feature Level 11_0) | **Apple Metal 3 & Metal 4** via Apple **D3DMetal / DXMT** |
| **Shaders** | HLSL Shader Model 5.0 + Compute Shaders | Metal Shading Language (MSL) |
| **Executable** | `NFS13.exe` (32-bit x86, v1.5) | Rosetta 2 / Box64 AOT execution |
| **Audio** | Criterion Audio / Miles Sound | CoreAudio / FAudio |
| **Input** | DirectInput & XInput (`xinput1_3.dll`) | macOS `GameController.framework` (DualShock 4 / DualSense) |
| **Physics** | Havok Physics & Criterion vehicle dynamics | 60+ FPS high-precision physics tick |

---

## ⚡ Performance on MacBook Pro 16" (Apple M1 Pro)

- **Target Framerate:** Locked **60 FPS** (or unlocked via `NFSMW2012FpsUnlock` ASI)
- **Target Resolution:** **1080p / 1440p / Retina** with high settings
- **Controller Support:** Native **Sony DualShock 4** (PS4) & DualSense with wireless haptic feedback
- **Display Pacing:** Liquid Retina XDR compatible with zero tearing

---

## 📂 Repository Contents

- [`docs/CHAMELEON_ENGINE.md`](docs/CHAMELEON_ENGINE.md) – Deep dive into Criterion's Chameleon engine, `.BNDL` asset bundle structures, deferred shading pipeline, and `NFS13.exe` memory layout.
- [`docs/D3DMETAL_AND_GPTK.md`](docs/D3DMETAL_AND_GPTK.md) – Technical analysis of Direct3D 11 to Apple Metal 4 translation using D3DMetal, handling compute shaders, and MSync frame synchronization.
- [`docs/MACOS_SETUP_GUIDE.md`](docs/MACOS_SETUP_GUIDE.md) – Step-by-step launch guide, fixing the infamous audio reverberation loop bug, and setting up the DualShock 4.
- [`scripts/verify_chameleon_assets.py`](scripts/verify_chameleon_assets.py) – Asset integrity checker for Fairhaven City (`HAWAII`), vehicles, and shader bundles.
- [`scripts/launch_mw2012.sh`](scripts/launch_mw2012.sh) – Automated macOS launcher script configuring D3DMetal environment variables and controller bridges.

---

## 📜 Legal & Preservation Disclaimer
This documentation and accompanying scripts are provided for educational research, software preservation, and interoperability purposes under fair use. No copyrighted EA or Criterion Games proprietary binaries, textures, or audio are hosted in this repository. Users must supply their own legally purchased copy of the game.
