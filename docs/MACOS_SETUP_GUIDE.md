# macOS Setup & Play Guide: Need for Speed Most Wanted (2012)

This guide walks through configuring and running *Need for Speed: Most Wanted (2012)* smoothly on your **M1 Pro MacBook Pro** using the files already on your system.

---

## 1. Verified Local Game Directory

Your game files are located at:
```text
/Users/deeraj/Downloads/Need-for-Speed-Most-Wanted-AnkerGames/Need for Speed - Most Wanted/
```

Inside this directory:
- `NFS13.exe` (v1.5 standalone binary, DRM-free)
- `HAWAII` (Fairhaven City world geometry)
- `VEHICLES` (Car models and physics assets)
- `SHADERS.BNDL`, `POSTFX.BNDL` (Direct3D 11 shader packages)

---

## 2. Essential Fixes for macOS & Apple Silicon

### ⚠️ Fix 1: The Infamous Audio Stutter / Reverb Bug
By default on macOS translation layers, the Chameleon engine's software reverb filter causes audio loops and stuttering.

**The Fix:**
1. Once in the game, open **Settings → Audio**.
2. Set **Reverberation** to **OFF**.
3. Sound effects, police radio chatter, engine RPM notes, and music will now play smoothly without stutter.

---

### 🎮 Fix 2: Sony DualShock 4 Controller Setup
1. Turn off your DualShock 4.
2. Hold down the **PS Button + SHARE Button** simultaneously for ~3 seconds until the light bar flashes rapidly in white.
3. On your Mac, open **System Settings → Bluetooth** and connect to **"DUALSHOCK 4 Wireless Controller"**.
4. The game will automatically recognize it as an Xbox 360 controller with full analog trigger acceleration (`R2`), braking (`L2`), steering, and vibration.

---

### 🏎️ Fix 3: 60 FPS Cap Unlock (Optional)
The PC version originally shipped with a hardcoded 60 FPS frame limiter. On a 120Hz ProMotion MacBook Pro screen:
1. Place the open-source `dinput8.dll` and `NFSMW2012FpsUnlock.asi` into the game root.
2. The game will unlock to run at **120 FPS** on your Liquid Retina XDR display!

---

## 3. Recommended Graphics Settings (M1 Pro 16-Core GPU)

For a locked 60 FPS (or 120 FPS with unlocker):

| Setting | Recommended Value |
| :--- | :--- |
| **Resolution** | `1920 × 1080` (or `2560 × 1440` Retina) |
| **Texture Detail** | **High** |
| **Shadow Quality** | **Medium** |
| **Headlight Shadows** | **Low** (Disables heavy multi-light shadow maps) |
| **Motion Blur** | **High** |
| **Ambient Occlusion (SSAO)** | **High** |
| **Light Scattering** | **High** |
