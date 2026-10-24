# processing-sketches: design

Last updated: 2026-10-24

## 1. What it is
A folder of Processing sketches; see the wiki pages `processing-sketches`, `drachenkurve` and `drachenfraktal`.

## 2. Decision log

| Date | Type | Decision | Why |
|---|---|---|---|
| 2026-10-24 | Preventive | **Put under git on GitHub (private) with a gate and CI** (`pipeline-check`, local pre-push check); build output is ignored | Standard of Giovanni's systems: every project is a versioned GitHub repository. The folder had no history; `drachenkurve/build/` held about 30 jars that must not be versioned |
