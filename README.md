# processing-sketches

Processing sketches: drachenkurve (dragon curve) and drachenfraktal. Private.

Maintenance: `tools/quality_gate.sh` is the gate; `tools/pipeline-check.sh` (program: github.com/yujideluca/pipeline-check,
pinned in `pipeline-check.version`) runs it with the fitness checks and CI runs the same. Enable the local pre-push check with
`git config core.hooksPath tools/hooks`.
