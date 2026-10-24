#!/usr/bin/env bash
# Quality gate: every sketch folder holds a .pde file of the same name (Processing's rule), and no build output is tracked.
set -euo pipefail
cd "$(dirname "$0")/.."
for d in */; do
  d=${d%/}; [ "$d" = tools ] || [ "$d" = docs ] || [ "$d" = build ] || [ "$d" = .github ] && continue
  [ -f "$d/$d.pde" ] || { echo "FAIL: $d has no $d/$d.pde"; exit 1; }
  echo "sketch ok: $d"
done
! git ls-files | grep -q '/build/' || { echo "FAIL: build output is tracked"; exit 1; }
