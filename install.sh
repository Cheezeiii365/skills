#!/usr/bin/env bash
set -euo pipefail

# Usage: ./import-skills.sh /path/to/new-repo [remote-git-url]
TARGET_DIR="${1:-}"
REMOTE_URL="${2:-}"

if [ -z "$TARGET_DIR" ]; then
  echo "Usage: $0 /path/to/new-repo [remote-git-url]"
  exit 2
fi

# Source skills folder (update this path if your workspace is elsewhere)
SOURCE_DIR="/Users/btodoy/Documents/Projects/Code/aide/aIDE/skills"

if [ ! -d "$SOURCE_DIR" ]; then
  echo "Source folder not found: $SOURCE_DIR"
  exit 3
fi

# Create target dir and copy files
mkdir -p "$TARGET_DIR"
cp -a "$SOURCE_DIR/." "$TARGET_DIR/"

cd "$TARGET_DIR"

# Initialize git repo and commit
if [ ! -d .git ]; then
  git init
fi

# Ensure a branch exists (use main)
git checkout -b main 2>/dev/null || git switch -c main 2>/dev/null || true
git add --all
git commit -m "Initial import: skills files" || echo "Nothing to commit"

# If a remote URL was provided, add it and push
if [ -n "$REMOTE_URL" ]; then
  git remote remove origin 2>/dev/null || true
  git remote add origin "$REMOTE_URL"
  git branch -M main
  git push -u origin main
fi

echo "Repository created at: $TARGET_DIR"
if [ -n "$REMOTE_URL" ]; then
  echo "Pushed to remote: $REMOTE_URL"
fi