# skills

A collection of Claude Code skills (slash commands) for automating developer workflows.

## Skills

### `/commit`

Analyzes your current git status, staged/unstaged changes, and recent commit history, then creates an appropriate commit with a well-crafted message.

### `/commit-push-pr`

Full PR workflow in a single command. Creates a branch (if on main), stages and commits changes, pushes to origin, and opens a pull request via `gh pr create`.

### `/frontend-design`

A design philosophy guide for building distinctive, production-grade frontend interfaces. Emphasizes bold typography, cohesive color palettes, intentional motion, and spatial composition -- avoiding generic "AI slop" aesthetics.

### `/pr-review-analyze`

Analyzes PR review comments without writing code. Classifies each piece of feedback as fix now, defer, or push back, with structured reasoning about correctness, scope, risk, and cost.

## Installation

From any git repo, run:

```bash
curl -fsSL https://raw.githubusercontent.com/Cheezeiii365/skills/main/install.sh | bash
```

This clones the skills repo, copies each skill into `.claude/skills/`, and cleans up. Folders are created automatically if they don't exist.

## Structure

Each skill lives in its own directory with a `SKILL.md` file that defines the skill's behavior:

```
skills/
  commit/SKILL.md
  commit-push-pr/SKILL.md
  frontend-design/SKILL.md
  pr-review-analyze/SKILL.md
  install.sh
```
