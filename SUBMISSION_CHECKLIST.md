# FramePilot submission checklist

## Ready-to-submit description

**FramePilot AI** is a local-first, browser-based director's preproduction workspace powered by Meta model APIs. Upload an original screenplay, generate an editable scene/shot breakdown, block the selected shot with a 3D camera, sketch the composition, select objects with SAM, refine frames with Muse Image, review camera suggestions with Muse Spark, and export a director's storyboard and production package. The key idea is one source-of-truth scene and shot across the tools instead of disconnected AI images.

## Judge demonstration (record once, 3 minutes)

1. Launch `START_FRAMEPILOT.bat` on Windows or `bash START_FRAMEPILOT.sh` on macOS/Linux.
2. Open `http://127.0.0.1:8016/book`, use **Original demo** (original copyrighted-safe material shipped with the app).
3. Point out the scene/shot context shared across **3D SET**, **DRAW**, **ART STUDIO**, **DIRECTOR AI**, and **HISTORY**.
4. Stage an actor, change camera framing and capture. Demonstrate the SAM mask or a prepared successful edit; run one real Meta edit only if your API and quota have been validated.
5. Export **Production package ZIP**; open the generated PDF and `/production` planning tools.

## Publishing

- [ ] Verify app launch, script import, one shot edit, one export on the actual demo computer.
- [ ] Record a demo video and play it back from its final URL.
- [ ] Push this cleaned source ZIP's contents to the public GitHub repository.
- [ ] Open both GitHub and video URLs in a signed-out/private browser window.
- [ ] Verify `.env`, local account databases, uploaded proprietary materials, and Meta API keys are absent.
- [ ] Fill in the hackathon submission, including the actual working links, and submit before the organizer's deadline.

**Don't claim** live Meta validation or scale benchmarks that haven't been measured. The code is a tested prototype; all AI calls depend on valid Meta credentials and quotas. Never publish user-uploaded commercial scripts, including *Interstellar*, without permission.
