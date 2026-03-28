#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/Cheezeiii365/skills.git"
SKILLS_DIR=".claude/skills"

# Allow running from anywhere inside a git repo
ROOT=$(git rev-parse --show-toplevel 2>/dev/null) || {
  echo "Error: not inside a git repository."
  exit 1
}

TARGET="$ROOT/$SKILLS_DIR"
TMP=$(mktemp -d)

trap 'rm -rf "$TMP"' EXIT

echo "Cloning skills repo..."
git clone --depth 1 "$REPO_URL" "$TMP" 2>/dev/null

mkdir -p "$TARGET"

# Copy each skill directory (folders containing SKILL.md)
for skill in "$TMP"/*/; do
  [ -f "$skill/SKILL.md" ] || continue
  name=$(basename "$skill")
  rm -rf "$TARGET/$name"
  cp -R "$skill" "$TARGET/$name"
  echo "  Installed: $name"
done

echo "Skills installed to $TARGET"
