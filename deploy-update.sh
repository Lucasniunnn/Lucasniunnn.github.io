#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/../.." && pwd)"
DEPLOY_DIR="$ROOT_DIR/outputs/deploy"

cp "$ROOT_DIR/outputs/iberia_trip_plan.html" "$DEPLOY_DIR/index.html"
cd "$DEPLOY_DIR"

git add index.html
if git diff --cached --quiet; then
  echo "No deploy changes."
  exit 0
fi

git commit -m "Update trip itinerary"
git push origin main
