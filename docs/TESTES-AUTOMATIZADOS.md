# Automated bug-finding tests: processing-sketches

Last reviewed: 06475b0 2026-10-24
Created by the skill `gerar-teste-automatizado` (create mode).

## Analysis summary
Two Processing sketches (`drachenkurve`, `drachenfraktal`): drawing programs with no inputs, no data and no business rules. Processing sketches cannot be run headless in CI without the Processing toolchain.

## Test matrix
Static only: every sketch folder holds a `.pde` of the same name and no build output is tracked (the gate checks both).

## Results (observed, 2026-10-24)
Gate and CI pass. The sketches were not run in this review.

## Defects found
None by static checks. Not verified: that the sketches compile and draw.

## Limitations and residual risks
Any change to a sketch is verified only by looking at it.

## Recommendations
1. If the sketches grow, move the geometry (the dragon-curve recurrence) into a plain function with a unit test (expected corner points computed by hand for the first iterations) and keep drawing as a thin layer.
