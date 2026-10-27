# Architecture: Criterion Chameleon Engine & NFS13.exe

## 1. Engine Evolution & Background

*Need for Speed: Most Wanted (2012)* was developed by **Criterion Games** using their proprietary **Chameleon Engine**.

```
    [ Burnout Paradise (2008) ]
                 |
                 v
    [ NFS: Hot Pursuit (2010) ]
                 |
                 v
    [ NFS: Most Wanted (2012) ]  <-- Chameleon Engine 2.0 (Strict D3D11)
```

Unlike the 2005 Black Box engine (EAGL3), Chameleon was designed from the ground up for high-speed open-world rendering, procedural crash deformation, and modern deferred lighting.

---

## 2. World Architecture: Project "HAWAII"

Inside the game files and debug strings, Fairhaven City is internally codenamed **`HAWAII`**:

```text
HAWAII/
├── ROADS/            # Road mesh splines, intersection nodes, AI traffic lanes
├── PROPS/            # Destructible streetlights, billboards, and speed cameras
├── SECTORS/          # Spatial partitioning streaming cells (LOD0 to LOD3)
└── TERRAIN/          # Ground heightmaps and static city structures
```

### Dynamic World Streaming:
- The streaming engine uses a spherical distance cache around the player vehicle.
- As vehicle speeds exceed 200+ mph (Bugatti Veyron Super Sport / Koenigsegg Agera R), high-priority streaming threads pre-load upcoming sector geometry and texture mipmaps from `.BNDL` containers to prevent pop-in.

---

## 3. Rendering Pipeline: Pure Direct3D 11 Deferred Shading

NFS MW 2012 completely abandoned Direct3D 9 and required **Direct3D 11.0 Feature Level 11_0**:

```
                       +------------------------------+
                       |       Geometry Pass (MRT)    |
                       +--------------+---------------+
                                      |
         +----------------------------+----------------------------+
         |                            |                            |
+--------v--------+          +--------v--------+          +--------v--------+
|   RT0: Albedo   |          |   RT1: Normal   |          |  RT2: Spec/Rough|
+--------+--------+          +--------+--------+          +--------+--------+
         |                            |                            |
         +----------------------------+----------------------------+
                                      |
                       +--------------v---------------+
                       |       Light Accumulation     |  (Compute Shaders)
                       +--------------+---------------+
                                      |
                       +--------------v---------------+
                       |       Screen-Space Passes    |  (SSAO, SSR, Motion Blur)
                       +------------------------------+
```

### Key Graphical Features:
1. **Deferred Lighting with Compute Shaders:** Hundreds of dynamic streetlights, vehicle headlights, and police flashing lightbars rendered without exponential draw-call overhead.
2. **Dynamic Vehicle Damage & Deformation:** Criterion’s vertex displacement mesh deformer, peeling body panels, crunching hoods, and detaching bumpers on collision.
3. **Screen-Space Reflections (SSR):** High-gloss car paint and wet asphalt dynamically reflecting Fairhaven’s skyscrapers and pursuit cruisers.
4. **Physically-Based Shading (Early PBR):** Microfacet specular reflections on metallic, carbon fiber, and rubber surfaces.

---

## 4. Binary Architecture (`NFS13.exe`)

- **Format:** 32-bit x86 PE executable (`~13.6 MB`)
- **Version:** Patch v1.5 (Final retail release)
- **Primary Dependencies:**
  - `d3d11.dll` & `dxgi.dll` (Direct3D 11 graphics & swapchain)
  - `d3dcompiler_43.dll` (Runtime HLSL shader compilation)
  - `xinput1_3.dll` (Xbox 360 controller API)
  - `xpsmt4.dll` (Sony PS Move / input stubs)
- **DRM Status:** The retail release originally required EA Origin / EA Desktop. Digital community backups remove the Origin DRM wrapper, allowing standalone execution.
