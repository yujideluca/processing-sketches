# processing-sketches: working notes for Claude Code

Small Processing sketches (`drachenkurve/`, `drachenfraktal/`), one folder per sketch, each holding a `.pde` of the same name.
Build output (`build/`, jars) is never committed.

- Gate: `tools/quality_gate.sh` (every sketch folder has its `.pde`; no build output tracked); full measurement `tools/pipeline-check.sh`.
  After pushing, CI must be green. The sketches have no automated behaviour tests yet (debt P3).
- Never force-push. Ask Giovanni before anything outward-facing. Decisions go in `DESIGN.md`.
  At the end of a task update the wiki (`wiki publish`), then `mem use`.
