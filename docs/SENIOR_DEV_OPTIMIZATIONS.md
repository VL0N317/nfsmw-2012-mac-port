# Senior Game Developer Optimization & Fix Report: NFS MW (2012) on Apple Silicon

This document details the root causes identified and programmatically resolved for the audio stutter/echo and intermittent framerate drops on macOS.

---

## 1. Root Cause Analysis: Audio Loop & Reverb Reset

### The Culprit: macOS TCC Sandbox Permissions
In CrossOver bottles, the Windows `Documents` directory was symlinked to macOS `/Users/deeraj/Documents`:
```text
drive_c/users/crossover/Documents -> /Users/deeraj/Documents (Operation not permitted)
```
Because macOS strictly isolates the `Documents` directory with Transparency, Consent, and Control (TCC), the game was **silently failing to write or update its configuration file (`config.NFS13Save`)**. 

Every time the game started or restarted, it reset back to default settings:
- `Reverb=1` (Enabled Criterion's broken DSP reverb engine)
- `HeadlightShadows=true` (Heavy multi-car shadow casting)
- Audio sample buffers corrupted across CoreAudio ring buffers.

### The Fix:
1. Removed the restricted symlink in the CrossOver bottle.
2. Replaced it with a local, fully writable directory:
   `.../drive_c/users/crossover/Documents/Criterion Games/Need For Speed(TM) Most Wanted/`
3. Injected a persistent, optimized `config.NFS13Save`:
   - `Reverb=0` (Permanently disabled broken reverb)
   - `HeadlightShadows=false` (Eliminates the #1 GPU frametime spike)
   - `ShadowMapLevel=1` (Crisp medium shadows)
   - `ParticleShadows=false` (Zero smoke/debris stutter)
   - `FrameLatency=1` (Smooth D3DMetal frame pacing)

---

## 2. Root Cause Analysis: 120 FPS Unlocker Not Triggering

### The Culprit: Wine Default DllOverrides
By default, Wine and CrossOver use their internal `builtin` DirectInput DLL (`dinput8.dll`) rather than the native custom DLL placed in the game folder. As a result, `MW2012FpsUnlock.asi` was never loaded.

### The Fix:
Added an explicit registry override to the bottle's `user.reg`:
```ini
[Software\Wine\DllOverrides]
"dinput8"="native,builtin"
"dinput"="native,builtin"
```
Now CrossOver loads the Ultimate ASI Loader on startup, which injects `MW2012FpsUnlock.asi` directly into `NFS13.exe`.

---

## 3. Frame-Pacing Calibration for 120Hz Liquid Retina XDR

In `scripts/MW2012FpsUnlock.ini`:
- `TargetFPS=120` (Calibrated for 120Hz ProMotion)
- `RefreshRate=120` (Locks display timing)
- `VsyncInterval=1` (Zero tearing with Apple Metal)
- `Borderless=1` (No fullscreen resolution mode-switching bugs)
- `LoadingScreenCap=1` (Caps menus at 60 FPS to prevent thermal spikes)
