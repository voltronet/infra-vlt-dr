#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
MODULES=("vpc" "storage" "compute")

for module in "${MODULES[@]}"; do
  echo "==> Testing module: $module"
  pushd "$ROOT_DIR/tests/$module" >/dev/null
  terraform init -backend=false
  terraform validate
  popd >/dev/null
  echo "==> Module $module validation passed"
  echo
 done
