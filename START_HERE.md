**Current release: v0.13.5.** Import Film now appears above all editor tools. In **Art & Muse**, use SAM to select an actor, object or backdrop and apply local remove/recolor/replacement effects with history. In **3D scene**, GLB imports directly; `.blend` conversion requires installed Blender and explicit local opt-in. Details: `docs/SAM_BLEND_V0135.md`.

# FramePilot AI — Start here

## What this complete package contains

A browser-based local filmmaking workspace connecting a screenplay's scenes and shots to 3D camera/actor blocking, drawing, SAM-based selections, Muse Image edits, shot history and production documents. It also includes optional self-hosted profiles, a production-planning hub and voice-to-storyboard tools. It is a **local-first prototype**, not a deployed enterprise SaaS.

## Windows — recommended

1. Extract this single ZIP. It creates `framepilot_ai/`.
2. Open **PowerShell** in `framepilot_ai/` (the folder containing `START_FRAMEPILOT.bat`).
3. Run `./START_FRAMEPILOT.bat`. Python 3.10+ with pip and an Internet connection for dependency installation are required on first run.
4. Open `http://127.0.0.1:8016/book` in Chrome or Edge.
5. Press **Try demo** to inspect an original two-scene film with bundled, non-AI illustrated frames; no Meta key is required.
6. Select a shot. Use the six always-visible editing choices: **3D scene / Drawing / Art & Muse / AI director / Voice / Versions**. The current scene and shot remain the shared editing target.
7. Select the visible **Download film** button to get the project and PDF volumes.
8. To use live SAM/Muse, edit the private `.env` created at startup with your valid `MODEL_API_KEY`, then restart. Do not publish `.env` or any private screenplay.

### macOS / Linux

Run `bash START_FRAMEPILOT.sh` from the `framepilot_ai/` folder. The launcher creates its own `.venv`. Open the same local URL.

### Browser or request errors

From another PowerShell terminal while the app runs: `./CHECK_FRAMEPILOT.ps1`.
For a specific error: `./CHECK_FRAMEPILOT.ps1 -RequestId 'the-id-shown-in-browser'`.
Custom port: `./CHECK_FRAMEPILOT.ps1 -Port 8020`.
The application log is `private_uploads/logs/framepilot.log`.

### Test this release

`python tools/release_check.py` runs safe, in-process HTTP checks (no paid Meta requests).
`python tools/release_check.py --full` additionally runs Python and Node test suites (if Node is installed).
The tests use mock provider responses: **real Meta rendering, WebGL drivers and Windows/browser interactions require independent verification**.

### Existing data

A complete source ZIP is for **fresh installation**, not an in-place overwrite. Back up `.env`, `private_uploads/`, and `static/generated/` on your old installation and migrate them cautiously. Do not publish any of these. Do not paste credentials into chats or include them in videos.

### Important limitations

- Muse Image calls have account costs/rate limits. Large screenplay rendering is queued and can take many minutes; one-shot-per-scene preview is faster than complete coverage.
- SAM cutouts are editable 2.5D cards, not full rigged 3D characters. Imported GLB models can be transformed; `.blend` can be converted **only when locally enabled and Blender is installed**. See `docs/MINIMAL_FILM_WORKSPACE_V0132.md`; otherwise export `.glb` manually.
- Photo/video stages are image backplates; they are not volumetric 3D reconstructions.
- Accounts are stored on the host: cross-device cloud sync needs deployment and persistent storage.
- Two million concurrent users/requests have **not** been tested. The current SQLite/in-process design must be migrated before high-scale deployment.
- Do not redistribute copyrighted feature-film scripts as demo content. This package uses an original micro-screenplay only.

### Optional native Blender project import (.blend)

For **trusted local projects only**, install Blender and set `FRAMEPILOT_ENABLE_LOCAL_BLEND=1` in your local `.env`, then restart. The 3D importer will convert `.blend` to `.glb` using Blender in background with automatic Python execution disabled. Blender must be on PATH or configured by `FRAMEPILOT_BLENDER_BIN`. **Never enable this on a public server:** use an isolated media-processing service instead. GLB imports do not require Blender.

### Minimal v0.13.4 workstation

The primary screen is the current screenplay and shot. Use Book / Screenplay / Workspace view, or maximize the 3D viewport. Restoring maximized 3D releases document scroll; the inspector scrolls independently while maximized. Rendering all Muse images still depends on Meta's latency, quotas, credits and the number of frames.
