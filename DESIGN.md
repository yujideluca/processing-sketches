# processing-sketches: design

Last updated: 2026-10-25

## 1. What it is
A folder of Processing sketches; see the wiki pages `processing-sketches`, `drachenkurve` and `drachenfraktal`.

## 2. Decision log

| Date | Type | Decision | Why |
|---|---|---|---|
| 2026-10-25 | Preventive | **Monthly architecture review**: pipeline-check v0.4.0, local mode, report of 2026-10-25: 0 falhas, 0 avisos, 1 pulado (protecao-de-branch); 1 proposal; proposals created as pipeline-check#4 | Monthly review standard (ADR-0013): the program measures, the skill judges |
| 2026-10-24 | Preventive | **First maintenance review**: report ok; the sketches have no behaviour tests (`docs/TESTES-AUTOMATIZADOS.md`); proposal not yet created as an issue: P3 move the curve geometry into a tested function if the sketches grow | Standard first review of a project that now has a gate |
| 2026-10-24 | Preventive | **Put under git on GitHub (private) with a gate and CI** (`pipeline-check`, local pre-push check); build output is ignored | Standard of Giovanni's systems: every project is a versioned GitHub repository. The folder had no history; `drachenkurve/build/` held about 30 jars that must not be versioned |
