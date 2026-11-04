## v0.13.5 — Mask-based local editing + explicit Blender import + clear film-import dialog

- Added local SAM actions for subject transparency, subject replacement/recolor, background replacement/recolor, alongside approximate Remove & Heal, subject isolate and blur. Replacement images are uploaded as private, validated image references and saved as independent shot versions.
- Added 3D model capability reporting and explicit on-screen `.blend` prerequisites. Direct `.glb` continues to work; `.blend` conversion requires local opt-in and installed Blender.
- Prevented shot-tool toolbar from overlapping Import Film dialog at desktop and phone widths; added scrollable white/teal dialog.
- Validated 114 Python and 49 JavaScript tests, plus static Chromium dialog sizing at 1440, 768 and 390 px. Live external Meta and native Blender conversion remain unverified.

## v0.13.4 · Clear Workspace navigation

- Six clearly labelled editor tools visible at all widths without opening a collapsed menu.
- Script and selected shot remain central, with a quiet quick-action strip.
- Moved large full-film render settings out of the primary shot area.
- Made important 3D inspector controls always visible, with quick jumps.
- Promoted full-film download to a visible top-bar button.
- Kept all prior editing IDs, API calls, data formats, and user projects unchanged.

## v0.13.4 — Minimal film workspace + local Blender conversion

- Original white/teal minimalist editor with clearer primary film actions, compact top bar, larger active frame, simpler tool tabs and properly separated screenplay notes/navigation.
- Desktop and mobile static Chromium layout review; thin viewer border and no overlapping screenplay controls.
- Maximize/restore scroll state preserved and independently scrollable fullscreen 3D inspector.
- Optional localhost-only `.blend` → GLB import through installed Blender with autoexec disabled (off by default); GLB retains its default import flow.
- Preserves all v0.13.x screenplay OCR, camera grammar, PDF draft compositions and Muse recovery improvements.

## v0.13.0 — Script-to-frame reliability + cinema composition

- OCR checked by default on direct and resumable screenplay uploads; source page completeness validated before the project is saved. If OCR cannot read a scanned film, the import fails clearly rather than saving two cover pages.
- New deterministic camera grammar: framing, action axis, perspective, lens selection and motivated lighting are attached to each planned beat. No claim these are creatively final.
- Unrendered frames are now illustrated by labelled, original schematic compositions in full production and comic PDFs. This does not use or charge Muse.
- Generated frames update in the UI while batch rendering continues without overwriting unsaved screenplay text/drawings. Broken image URLs show an explicit error, not the misleading empty-frame placeholder.
- Muse Spark Director proposals accept validated partial JSON. Malformed responses return a clearly labelled offline recovery plan for approval instead of HTTP 502. No plan is applied without human approval.
- The full production ZIP explicitly covers all scenes; single-volume PDF exports remain available.
- Local-first build: live Meta inference, native Windows/OS execution and high concurrency are still not fully verified.

## v0.12.5 — Submission reliability

- Preview-first entire-book render order, bounded ETA estimation, explicit failed-item requeue, current-shot identity, continuous Muse revisions, SAM local Remove & Heal and 2.5D staging cutouts.

# FramePilot v0.12.3 — Long Audio Import

- Add 500 MiB private audio/video upload endpoint, with bounded streaming to disk and supported formats including MP3, WAV, M4A, FLAC, OGG/Opus, AIFF, WebM, MP4/MOV, and MKV. Unsupported or DRM media may not decode.
- Automatically find FFmpeg from PATH or the new cross-platform `imageio-ffmpeg` Python dependency.
- Convert audio to mono 16 kHz 16-bit WAV, split into 8-minute clips under Meta's 32 MB / 10-minute per-request limits.
- Introduce private in-process audio transcription jobs with upload/transcription progress, per-segment retry, cancellation, and authorized 24-hour TXT download. Source media is deleted after processing.
- Browser Voice-to-Storyboard tool now supports 500 MiB recordings and offers a complete TXT transcript, while the scene editor uses an editable 24k-character preview.
- Added tests for invalid extensions, 500 MiB boundary, audio segmentation, end-to-end mocked job, cancellation and FFmpeg auto fallback.

**Limitations:** Jobs are in-memory, not durable across restarts. Cloud multi-user deployments need persistent queues, quotas, malware scanning, object storage and isolated media workers. The 500 MiB cap is an application upload cap, not an upstream Meta API cap. Live Meta calls and a real 500 MiB end-to-end transfer were not tested.

## v0.12.0 — Original environments + Tide minimalist UI + Muse Director

- Removed the 1,000 procedural layout picker and its browser module. Old shot data remains readable and editable.
- Added an original scene design flow: empty stage, approved Muse Spark camera/object proposal, Blender GLB assets, and still/video or Muse Image backplates.
- Added type-and-range validation on Muse-proposed editable set objects and explicit preview/approval before applying geometry.
- Implemented teal-and-white UI across Director's Book and Production Hub, with large cinema viewport and clear creative controls.
- Preserved v0.12 account-session fixes, bounded transient Meta retry, Director AI shot-plan approval/undo, and prior filmmaking features.
- No claims of native Unreal rendering, automatic 2D-to-3D geometry reconstruction, or verified large-scale cloud throughput.

# v0.12.0 — Director AI / Muse API resilience / filmmaker UX

- Added an in-workspace Muse Spark Director Assistant that proposes typed camera, framing, blocking, props, sound, lighting, continuity and safety changes. Every change is human-approved and undoable.
- Added hand-drawn composition guides from the assistant, saved director notes, quick filmmaking prompts, and a dark dual-pane layout.
- Added consistent bounded retries for Meta Model API 429/500/502/503/504 and transport errors, but not 400/401/403.
- Registration now automatically establishes a valid account session; a small diagnostics endpoint helps explain auth 401s.
- Preserved existing SAM/Muse Image, 3D environments, screenplay book, render queue and Production Hub.
- Added unit and API regression tests, and an original static desktop layout smoke check. No claim of live Meta/WebGL or cloud-scale validation.

## v0.11.0 — Custom environment media and director sketches

- Fixed-ratio 16:9 stage viewport with optional unlock, maximization and inspector.
- Private streaming environment image/video uploads (PNG/JPG/WebP/MP4/WebM) and browser VideoTexture playback.
- Muse Image environment concept background generation; preserved editable 3D GLB actor/prop/set imports.
- Sketch undo/redo, line/rectangle/ellipse tools, composition guides, Sketch → Studio/3D and blocking map export.
- Eight bounded per-host generation operations with shared semaphore, RPM pacing, cancellation checks and no visible worker-count setting.
- Automated regression coverage for protected media assets and UI contracts.
- Did not perform a real Meta inference benchmark, end-to-end video decode test or distributed 2M-request load test.

## v0.10.1 — Production readiness foundations
- Per-process admission and optional rate quotas with 429/503 and Retry-After.
- Readiness and liveness endpoints plus operator-only capacity counters.
- Optimistic project revision locking (409 instead of silent lost edits).
- Safe read-only localhost load probe, staged single-host Compose, deployment checklist.
- Preserves Environment Studio, fast rendering, cross-platform launchers, and Production Hub.
- Still local-first; requires PostgreSQL/object storage/distributed jobs to scale.

## v0.10.1 — Connected Production Hub
- Dedicated responsive production planning UI; 14 tools with shared scenes, shots, profiles and downloadable PDFs.
- Contact directory, task list, calendar, shoot-day schedule, breakdown tags, mood boards, call-sheet notes.
- Shot-list, AV-script, scene-filtered script sides, call-sheet, schedule, and planning exports.
- Existing account/project permissions applied to production API routes.
- Production package includes planning PDFs and project JSON (sensitive, do not publish).
- Carries forward editable 3D stages, custom GLB imports and faster Muse generation controls.
- No email sends or real-time cloud collaboration claimed.

## v0.9.3 — Environment Studio (historical; catalogue retired in v0.12)
- 1000 deterministic procedural 3D scene configurations across 25 locations, searchable by category and name.
- Environment replacement with option to retain actors, saved with individual shot camera.
- Photo backdrop upload and Blender GLB actor, prop or full-environment imports.
- Procedural recognizable primitives, lighting and colors with independent object controls.
- Tests for library size, deterministic layout and user interface controls.

# FramePilot AI v0.9.2 — Fast preview and cross-platform

- Render settings: first shot per scene or all remaining shots; per-shot style or batch preset + custom art direction.
- Up to four parallel image rendering calls per local job with atomic SQLite task claims and cancellation boundaries.
- Server-side profile display-name editing; existing account login/registration retained.
- Windows, macOS, Linux and development Docker setup instructions.
- Preserves existing v0.9.1 project data and API endpoints.
- No guarantees of cloud deployment, 2-million-user load, or provider rendering latency.

# v0.9.0 - Integrated Director Workstation

- Add visible Muse/SAM loading, persistent generation job status, page/scene batch rendering, cancellation between shots, and per-shot error records.
- Add a grouped export menu with production ZIP, production PDF, comic PDF, editable project JSON and current-page PDF.
- Add optional self-hosted user registration/sign-in, HttpOnly sessions, password hashes and owner-filtered project listings.
- Add account ownership to resumed uploads and imported screenplay projects; protect generated media and saved reference/model assets in account mode.
- Add operator-only local-to-account migration script with an SQLite backup.
- Improve viewport/control alignment and mobile/laptop styles; preserve existing Art Studio, Cinema 3D and book tools.
- Add regression tests for production bundles, batch generation, account isolation and session invalidation.

**Scope:** local-first beta. Cloud deployment, real device WebGL, live Meta billing/inference and load tests are still required.

## 0.9.1 — Entire-screenplay shot planning and rendering queue
- Free PDF-to-shot expansion, preserving source pages and retaining edits when rerun.
- One-click **Render entire screenplay** with an exact billable-call estimate and confirmation.
- Persist individual queue items and per-shot progress instead of repeatedly serializing all results as one JSON array.
- Skip existing images, stop after the current frame, and mark unconfirmed in-flight work as interrupted after restart.
- Added full-screenplay tests and a bounded Locust load profile with a 2M-concurrency production architecture checklist.

## v0.12.2 — Full export integrity and security audit

- Fixed complete production ZIP to cover all scenes in numbered 250-scene PDF volumes; added manifest, full editable JSON, generated frames and revisions.
- Prevented a signed-in user attaching another account's uploaded reference image to their own shot.
- Aligned release labels and browser cache busting, and updated stale test expectations.
- Added regression tests for >250 scenes, media inclusion, range validation and account reference isolation.
- Added technical audit and prioritized unresolved acceptance criteria in docs/FRAMEPILOT_AUDIT_2026-11-04.md.
