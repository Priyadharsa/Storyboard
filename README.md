> **v0.13.5:** The Import Film dialog now stays above editor tools. Art Studio can locally remove/recolor/replace a SAM-selected actor, object or background, with revisions. Blender `.blend` support is an opt-in local conversion, with a capability check. See `docs/SAM_BLEND_V0135.md`.

> **New in v0.13.5:** A clear six-tool shot navigation bar, always-visible 3D environment/camera/lighting controls, and direct Download film. See `docs/CLEAR_WORKSPACE_V0133.md`.

# FramePilot AI v0.13.5 — Minimal Film Workspace

A clean white-and-teal interface focused on **one screenplay, one scene, one selected shot**. The 3D set, drawing, Muse/SAM Art Studio, Director AI, audio and production exports keep the shared editing context. Screenplay OCR, image placeholder refresh, camera-aware PDF drafts and robust Muse planning from v0.13.0 are retained.

**One complete ZIP.** No API credentials, private projects, commercial film scripts or copied proprietary UI assets are included. See `START_HERE.md` for launch instructions and `docs/MINIMAL_FILM_WORKSPACE_V0132.md` for design and limitations. This is a local-first hackathon prototype, not proven 2-million-user infrastructure.

# FramePilot AI — Film Workspace (v0.13.5)

**Main fixes:** scanned-page auto OCR, no partial two-page imports, camera-aware draft compositions, saved Muse frame visibility during queued generation, resilient Director Spark plan recovery, and full-film ZIP exports.

# START HERE — FramePilot AI · Final Hackathon Source

**[First-run guide](START_HERE.md)** · **[Submission checklist](SUBMISSION_CHECKLIST.md)** · **[3-minute judges demo](docs/JUDGES_DEMO.md)** · **[Originality & positioning](docs/ORIGINALITY_AND_PITCH.md)** · **[Release verification](tools/release_check.py)**

This package unifies the v0.13.5 Film Workspace, Art Studio, Cinema 3D, SAM/Muse workflows, profiles, Voice → Storyboard, and Production Hub. One selected scene/shot anchors all creative tools. Start from the original bundled demo, then verify real Meta inference separately.

**App URL:** `http://127.0.0.1:8016/book` (unless `FRAMEPILOT_PORT` is set). **Cloud-scale and live Meta calls are not certified.**

## v0.12.5 — Submission-focused reliability update
- Render entire book in scene-preview-first order; refresh completed images while work continues.
- Explicit Retry failed frames requeues only failed, still-unrendered shots after confirmation. No automatic rebilling and no unsafe retry of uncertain in-flight calls.
- SAM Remove & Heal uses local mask-aware inpainting for approximate removal, or Muse for more complex edits.
- Stage a SAM-selected actor/prop as a movable transparent **2.5D card** in the same Cinema 3D shot, then save the scene. It is not a true 3D mesh or animated rig.
- Continuous Muse Image refinement on the selected shot saves successive versions with an approval/history flow.
- The scene/shot identity is shared across 3D, Draw, Art and Director AI. No new disconnected editor added.

**Submission checklist:** verify ONE real Meta generation and ONE SAM segmentation with the current key, record a 3-minute demo, publish the public repository without .env, and submit the demo video and repo before the deadline. This is a local-first prototype, not a measured 2M concurrent-user service.

# FramePilot AI v0.12.0 — Director Workstation + Production Hub

**New v0.12: Muse Director's Room** — a connected, human-reviewed copilot for camera settings, actor/prop blocking, 2D sketch guides, lighting, sound, stunt safety and shot continuity. Uses Muse Spark Model API; Muse Code remains a separate terminal coding agent. Account registration now creates a session immediately; temporary Meta 429/5xx requests retry with bounded backoff. See [Director AI guide](docs/DIRECTOR_AI_V012.md).

**One workflow:** full screenplay → editable book → scene and shot construction → SAM/Muse Art Studio → batch frame generation → clean production package.

New in v0.9:

- High-contrast, grouped controls and expanded studio canvas; export actions are consolidated under one menu.
- Visible loading during Muse/SAM calls; background batch image generation for selected page or scene, with persisted progress, errors and stop-after-current controls.
- One clean ZIP containing production PDF, comic PDF, project JSON and README. Original source files and secrets are excluded.
- Optional self-hosted profile registration/sign-in, server-side account project isolation and local-to-account migration tooling.
- Existing 3D set construction, cinema camera, 68 styles, SAM selection, Muse object edits, revision history and PDF storyboard exports preserved.

## Windows

Extract the ZIP into your Downloads directory. Open PowerShell **inside `framepilot_ai`** and run `./START_FRAMEPILOT.bat` (or double-click it). It creates the Windows `.venv` and installs dependencies. Open http://127.0.0.1:8016/book.

For an update to an existing v0.8.x installation, **back up `.env`, `private_uploads` and `static/generated`** first. Use the in-place hotfix ZIP and extract into the existing `framepilot_ai` directory; it does not contain private project data. Never overwrite the private folders with the empty directory from a full source ZIP.

## Profiles and cloud

Default mode `local` retains existing local projects. Cloud storage is not connected by this release. To turn on protected **self-hosted** profiles, set `FRAMEPILOT_AUTH_MODE=accounts` in `.env` and restart. Follow [UX and profiles guide](docs/UX_BATCH_AND_PROFILES.md) to migrate older projects and deploy to a real HTTPS host. A real cloud deployment and provider credentials are required for cross-device persistence.

## Test

```powershell
python -m pip install -r requirements.txt
python -m pip install pytest httpx
python -m pytest -q
npm test
```

The included tests mock external Meta inference; they cannot prove production-scale throughput or live Muse/SAM access. Report failures using the request ID in the server log.

For the full history and filmmaking workflow see `docs/CREATIVE_WORKFLOW.md`, `docs/ART_STUDIO_SAM_MUSE.md`, `docs/CINEMA_3D.md`, and `CHANGELOG.md`.

## v0.9.1 — Generate an entire screenplay

Import a PDF or TXT screenplay. The import worker creates one editable draft shot for every detected narrative beat **without invoking Meta**. In **Book**, click **Draft all shots (free)** to regenerate missing drafts without touching edited shots, or **Render entire screenplay** to review the number of Muse Image calls and start a persisted, cancellable queue. The model cannot render hundreds of images instantly; the button schedules them and progress is shown per completed frame. Already-rendered frames are excluded by default.

The sample `interstellar-2014.pdf` uploaded in the conversation parses as 157 PDF pages, 367 scene drafts, and 939 narrative-beat shot drafts with this parser. It is a diagnostic/test input and **is not shipped in the public source release**.

The included load-test recipe and the remaining work for 2 million concurrent users are documented in `docs/SCALE_2M_LOADTEST.md`. No 2M concurrency benchmark has been performed or claimed. Cloud autoscaling, authentication hardening, object storage, distributed workers and a horizontally scalable metadata store are prerequisites.


## v0.9.2 — Fast renders + OS support

Use **Fast preview** to render the first shot of each scene before committing to full coverage. Choose per-shot art styles or override with a selected style; choose 1, 2 or 4 concurrent Meta Image calls (server cap 4). Full coverage is a separate, confirmable action. See `docs/FAST_RENDER_AND_MULTI_OS.md`.

Start on Windows with `START_FRAMEPILOT.bat`, on macOS/Linux with `bash START_FRAMEPILOT.sh`, or use the development Dockerfile. The optional self-hosted Profile system supports account creation, login and editing your display name, but cloud storage still requires a deployment.


## v0.9.3 — Environment Studio

The legacy procedural layout picker has been retired in v0.12. The 3D editor now begins with an original empty stage or a Muse Spark-proposed, editable set. Independently editable objects, uploaded environment media, and Blender GLB files are the building blocks.

Choose Cinema 3D → Environment Design → describe a scene → Propose 3D blocking → review and approve → **Save scene**. Existing actors can be preserved. Load a JPG/PNG/WebP as a **2D photo backdrop**; a photo is not converted to actual 3D geometry. Import an entire custom 3D set or independently exported Blender characters and props as self-contained `.glb` files under 30 MiB. These objects can then be moved, scaled and rotated in the shot. Blender `.blend` files require exporting as GLB first. Model parts within one GLB are edited as a group; export separate files for separately editable parts.

Account mode protects private reference images and GLB files on self-hosted servers. Production cloud scaling and photogrammetric image-to-3D are not included. New assets are not packed into the JSON export; retain them on the original server.


## v0.10 — Production Hub (Indie production MVP)

Open **http://127.0.0.1:8013/production** or click **Production Hub** inside Director’s Book.
All planning records are attached to the selected project and inherit existing server-side account ownership.
The new project-level tools include:

- Screenwriting and storyboards: open the existing Director’s Book directly.
- AV scripts: two-column visual/audio PDF from scene dialogue and shot descriptions.
- Shot lists: film-wide shot inventory + PDF export.
- Mood boards: reference uploads and art-direction notes; reference-list PDF.
- Breakdown sheets: human-edited props/costumes/stunts/VFX categories per scene + PDF.
- Shooting schedules: assign scenes to dates and locations; export PDF.
- Script sides: filter by scene or shooting day and export PDF.
- Contacts, tasks, production calendar: editable records and PDF/CSV downloads.
- Call sheets: shoot-day plus contacts and safety/transport notes; PDF.
- File sharing: downloadable production ZIP, planning PDFs and CSV interchange.

Production Hub **does not yet support** bulk email/SMS distribution, public share links, real-time simultaneous editing, a full Kanban drag-and-drop board, weather feeds, advanced script revision markup, automatic labor-law compliance, offline sync, or an enterprise-scale crew directory. These require dedicated integrations and deployment. The application remains local-first unless deployed to a persistent HTTPS server.

Security: keep `.env`, `private_uploads/`, user profiles, and source PDFs private. Project-level planning records appear in the editable project JSON export: treat production packages as confidential.


## v0.11.0 — Scale-readiness and conflict protection

Retains Blender GLB imports, custom scene design, cross-platform
launchers, fast-generation modes, user profiles and connected Production Hub. Adds
per-process overload rejection, readiness checks, private counters, request security
headers, and cross-worker optimistic revision checks. See
`docs/PRODUCTION_READINESS_V101.md` for the architecture and exact work left for
large-scale cloud use. A staging-only Docker Compose sample is in `deploy/`.

**No 2-million-concurrency certification**: local SQLite storage and in-process
inference are still used. Do not deploy multiple replicas against this persistence.


## v0.11 — Custom Film Environments, Story Sketch Tools, Fixed Monitor

Launch **http://127.0.0.1:8015/book** (Windows: `START_FRAMEPILOT.bat`; macOS/Linux: `bash START_FRAMEPILOT.sh`). Existing projects should be backed up before patching.

**3D > ENVIRONMENT DESIGN:** start from an empty set or approved Muse proposal; import PNG/JPG/WebP backgrounds, silent-looped MP4/WebM video backgrounds, or a self-contained Blender GLB model (up to 30 MiB). Still and video backdrops are 2D layers behind editable 3D objects; **a video or photograph is not reconstructed into volumetric 3D**. Imported `.glb` models remain selectable and transformable. MP4/WebM upload uses a private streaming endpoint capped at 160 MiB; native playback depends on browser codec support. Model files have an independent 30 MiB limit. Studio image generation uses **Muse Image** through the existing Meta API and requires a valid key and credit access. It produces a 2D concept background, not a mesh.

Use the **Lock monitor 16:9** checkbox for a fixed-aspect viewport, or unlock it to fill available space. **Maximize 3D** expands the set view; **Blocking map · PNG** exports a top-down view for the crew.

**DRAW** offers freehand, straight line, rectangle, ellipse, undo, redo, and non-destructive rule-of-thirds guides. **Sketch → 3D environment** sends the drawing as a visual backdrop. **Sketch → Muse Studio** saves it as a composition guide for an AI-generated frame. The brush works with a mouse, pen, or touch. 3D geometry remains separate from the drawing.

The local image queue now allows up to **8 in-flight image calls per host**, with a configurable RPM pacing limit (`FRAMEPILOT_IMAGE_RPM=90` by default). This does not override Meta account limits or guarantee faster completion. Previous `.env` files may explicitly set `FRAMEPILOT_MAX_PARALLEL_RENDERERS=4`; update that value to 8 if you want the new local ceiling. Workers are managed internally, not exposed as a technical choice in the editor.

**Security/operations:** media is stored in `private_uploads/environment_media` with per-account read checks when account mode is enabled. Uploads are streaming and checked for supported containers and images. This is a prototype; public multi-user hosting needs malware scanning, video transcoding, database/object-storage migration, asset retention, global quotas, and load tests. Exporting a project JSON does not embed its private background files; keep the server storage when migrating projects.

**Validation:** local Python and JS regression tests; standalone Playwright navigation to localhost may be blocked by administrator policy. A rendered static layout check confirms 16:9 viewport geometry but does not prove WebGL or video decoding on Windows. The full Muse image generation workflow requires a real authorized provider call to verify.


## v0.12 — Director AI / account fixes / bounded retries

Open **http://127.0.0.1:8016/book** → choose a film and shot → **DIRECTOR AI**. Propose, review, apply to shot + 3D set, optionally add sketch guides, and undo the last AI pass. Use Offline creative draft to test without Meta credit. Sign-up automatically creates a signed-in session; account storage is self-hosted, not magically cloud-connected. Meta 401/403 are not retried; transient 429/5xx are retried at most twice. Keep the API key only in your local `.env`.


## v0.12 — Organic environments + Tide theme

The fixed catalogue of 1,000 procedural configurations has been **removed**.
Instead, Cinema 3D supports an original blank stage, user-provided PNG/JPEG/WebP/MP4/WebM as flat backplates,
self-contained Blender GLB props/characters/sets, and **Muse Spark scene suggestions**. Muse returns only
bounded data for the camera and editable proxy geometry; you review before changing the 3D viewport.
To obtain detailed geometry, model it in Blender and export GLB. A 2D image from Muse Image is a
visual reference, **not an automatically reconstructed volumetric 3D scene**.

The **Tide** UI uses a consistent teal-and-white palette, improved contrast, prominent primary actions,
and a dedicated Cinema 3D inspector. Viewports still support maximize/restore and a 16:9 monitor lock.
The same palette is used in the Production Hub.

The v0.12 Director AI integration uses Muse Spark Model API, not the Muse Code terminal agent.
Transient 429/5xx errors are retried with capped backoff; invalid credentials are not retried.
Account registration creates a session, but cloud sync needs external hosting and persistent storage.
See `docs/ORGANIC_ENVIRONMENTS_V012.md` and `docs/DIRECTOR_AI_V012.md`.

**Scaling status:** this is a local-first, tested application. PostgreSQL, object storage, distributed
queues, authenticated tenant isolation on a real deployment, external backups, and progressive load
testing are still required for truly high scale. No multi-million-concurrency performance is claimed.


### Large voice recordings (v0.12.3)
- In **Voice → Storyboard**, upload MP3, M4A, WAV, FLAC, OGG, Opus, AIFF, WMA, WebM, MP4, MOV, MKV or other listed common formats up to **500 MiB**.
- The local API streams the upload to private disk and transcodes it using system FFmpeg or the `imageio-ffmpeg` binary installed by pip. It splits recordings into ~8-minute, mono PCM WAV clips. Meta Voice itself retains its **32 MB / 10-minute per-request limits**.
- Long recordings create asynchronous local jobs with progress, cancel-between-clips and a private TXT download of the complete transcript. The editor displays the first 24,000 characters; download the TXT for the entire result or use **Import entire transcript as an editable film book** to create a new project from the complete transcript.
- Source audio is deleted when the job finishes or fails. Transcription TXT output is retained for up to 24 hours and cleaned up on subsequent job activity. This is a **single-host development queue**, not durable cloud processing; restarting while a job is running interrupts it. HTTPS, tenant quotas, durable workers, object storage, antivirus screening and retention policies are needed before public deployment.
- Some codecs/DRM files cannot be decoded. Playback support depends on the FFmpeg build, and transcription quality depends on the actual speech.
