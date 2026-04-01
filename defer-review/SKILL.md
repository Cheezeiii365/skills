---
name: defer-review
description: "Log a deferred PR review item as a GitHub issue using the gh CLI. Use this skill when a review comment has been marked 'Defer' (from pr-review-analyze or the user's own judgment) and the user wants it tracked as a GitHub issue so it isn't lost. Triggers include: 'defer this review', 'log a GitHub issue for this', 'create an issue for the deferred item', 'track this for later', or any instruction to turn a PR review comment into a GitHub issue. Always use this skill when the user wants to defer a review item to a tracked follow-up without acting on it now."
---

# Defer Review

## Purpose

Convert a deferred PR review comment into a properly formatted GitHub issue using the `gh` CLI, so the feedback is tracked and not lost.

This skill picks up where `pr-review-analyze` leaves off. The review item has been judged valid but inappropriate to fix in the current PR — flagged **Defer**. Your job is to log it cleanly as a GitHub issue.

---

## Prerequisites

Verify before starting:

```bash
# gh CLI is available
gh --version

# User is authenticated
gh auth status

# Confirm the current repo
gh repo view --json nameWithOwner -q .nameWithOwner
```

If `gh` is not installed or not authenticated, tell the user and stop. Do not attempt workarounds.

---

## Workflow

### 1. Extract the deferred item

From the review comment (or the `pr-review-analyze` output), identify:
- What the reviewer asked for
- Why it was deferred (not wrong, just not now)
- Which file(s) or area of the codebase it affects
- Any relevant context: PR number, branch name, reviewer name if available

---

### 2. Draft the issue

Before creating anything, show the user the draft and ask for confirmation.

**Issue title format:**
```
[Deferred] <concise description of the work>
```

Keep the title under 80 characters. It should be clear enough to understand without reading the body.

**Issue body template:**

```markdown
## Background

Deferred from PR #<number> (<branch-name> → <target-branch>).
Reviewer comment: <brief paraphrase of the original feedback>

## What needs to be done

<clear, actionable description of the work. Not just a restatement of the comment — explain what the end state should look like.>

## Why it was deferred

<one or two sentences: correct feedback, but out of scope / too large / better as a standalone PR / no current evidence of impact / etc.>

## Affected area

- File(s): <list if known>
- Component / module: <if known>

## Notes

<any additional context, links, or caveats. Leave blank if none.>
```

Fill in what you know. If PR number is not provided, omit that line rather than guessing.

---

### 3. Determine labels and assignees (optional)

Ask the user whether to apply any of the following — or apply defaults if the user says to just proceed:

**Suggested default labels** (only apply if they exist in the repo):
- `deferred` or `tech-debt` — to mark it as follow-up work
- `enhancement` or `refactor` — depending on the nature of the change

Check available labels first:
```bash
gh label list
```

Only use labels that already exist. Do not create new labels without asking.

**Assignee:** Default to unassigned unless the user specifies.

---

### 4. Create the issue

Once the user confirms the draft:

```bash
gh issue create \
  --title "<title>" \
  --body "<body>" \
  [--label "<label1>" --label "<label2>"] \
  [--assignee "<username>"]
```

For multi-line bodies, write to a temp file first to avoid shell escaping issues:

```bash
cat > /tmp/issue_body.md << 'EOF'
<body content>
EOF

gh issue create \
  --title "<title>" \
  --body-file /tmp/issue_body.md \
  [--label "<label1>"] \
  [--assignee "<username>"]
```

---

### 5. Confirm to the user

After successful creation, report:
- The issue number and URL (returned by `gh issue create`)
- The title
- Labels applied (if any)

Example output:
```
✓ Issue logged: #47
  https://github.com/org/repo/issues/47
  Title: [Deferred] Extract timeout config to environment variable
  Labels: tech-debt
```

---

## Hard rules

- **Always show the draft first** and get confirmation before creating the issue.
- **Do not create issues silently.** The user must approve title and body.
- **Do not create duplicate issues.** Before creating, do a quick search:
  ```bash
  gh issue list --search "<key terms from title>" --state open
  ```
  If a closely matching open issue exists, show it to the user and ask whether to proceed or link instead.
- **Do not close or modify the original PR.** This skill only creates issues.
- **Do not add labels that don't exist in the repo** without asking.
- **Do not assign the issue** unless the user specifies who.

---

## Edge cases

**Multiple deferred items:**  
Create one issue per item unless the user asks you to batch them. Separate issues are easier to track, assign, and close independently.

**PR number not available:**  
Omit the PR reference line from the body. Note the current branch name instead if available (`git branch --show-current`).

**No `gh` CLI available:**  
Tell the user. Offer to produce the formatted issue body as text they can paste into GitHub manually.

**Repo has required fields or issue templates:**  
If `gh issue create` fails due to required fields, show the error and ask the user how to proceed. Do not guess at required values.

**User wants a specific milestone:**  
```bash
gh issue create --milestone "<milestone name>" ...
```
Only if the user requests it — fetch available milestones first with `gh api repos/:owner/:repo/milestones`.

---

## Example trigger

```
/defer-review
Log issue for item 3 — the cache invalidation refactor.
```

Or, following a `pr-review-analyze` session:
```
Defer item 1 — create a GitHub issue for it.
```