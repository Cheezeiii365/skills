---
name: accept-review
description: "Implement a PR review fix immediately and commit it to git. Use this skill when a review item has been marked 'Fix now' (from pr-review-analyze or the user's own judgment) and the user wants the code change applied and committed. Triggers include: 'accept this review', 'implement this fix', 'apply the review comment', 'fix and commit', or any instruction to act on a specific review item and commit the result. Always use this skill when the user wants to go from a review decision to a committed code change without manual editing."
---

# Accept Review

## Purpose

Implement a specific PR review comment as a code change, then stage and commit it to the current git branch.

This skill picks up where `pr-review-analyze` leaves off. The review item has already been judged valid and flagged **Fix now**. Your job is to make the change and commit it cleanly.

---

## Prerequisites

Confirm before starting:
- You are on the correct branch (`git branch --show-current`)
- The working tree is in a known state (`git status`)
- You know which file(s) are in scope

If the working tree has unexpected changes, surface them to the user before proceeding.

---

## Workflow

### 1. Understand the fix

Re-read the review item. Identify:
- What exactly needs to change (logic, naming, structure, test, comment, etc.)
- Which file(s) and line(s) are affected
- Whether the fix is self-contained or has side effects
- Whether tests need to be updated or added

If anything is ambiguous, ask one focused question before writing code.

---

### 2. Locate the code

Read the relevant file(s) using available tools. Do not guess at line numbers or content — read first, then edit.

---

### 3. Implement the fix

Apply the minimal, targeted change that satisfies the review comment. Guiding principles:

- **Surgical edits only.** Do not refactor surrounding code unless the comment explicitly calls for it.
- **Preserve style.** Match indentation, naming conventions, and formatting already in the file.
- **No scope creep.** If you notice other issues while editing, do not fix them silently. Note them and stay focused on the reviewed item.
- **Update tests if needed.** If the fix changes behavior, update or add tests in the same commit unless the user says otherwise.

---

### 4. Verify the change

After editing, re-read the modified file section to confirm:
- The fix is correctly applied
- No unintended surrounding lines were modified
- Syntax is valid (if checkable)

If the repo has a lint or build command available and you can run it safely, do so. Surface failures immediately before committing.

---

### 5. Stage and commit

Stage only the files you intentionally modified:

```bash
git add <file1> [file2 ...]
```

Do **not** use `git add .` or `git add -A` unless the user explicitly asks, to avoid accidentally staging unrelated changes.

Commit with a clear, specific message:

```bash
git commit -m "<type>: <short description of what was fixed and why>"
```

**Commit message conventions:**
- Use conventional commit prefixes where appropriate: `fix:`, `refactor:`, `test:`, `docs:`, `style:`
- Keep the subject line under 72 characters
- If the review item came from a specific reviewer or references a PR comment ID, you may optionally add a short body line: `Addresses review: <summary of comment>`
- Do not add `Co-authored-by` or attribution lines unless the user requests it

---

### 6. Confirm to the user

After a successful commit, report:
- The commit hash (short form: `git rev-parse --short HEAD`)
- The files changed
- A one-line summary of what was fixed

Example output:
```
✓ Committed 3a8f21c
  Files: src/auth/token.ts
  Fix: removed hardcoded timeout, now reads from config
```

---

## Hard rules

- **Do not push.** This skill commits locally only. Pushing is the user's decision.
- **Do not amend previous commits** unless explicitly asked.
- **Do not commit unrelated files** — always check `git status` before and after staging.
- **Do not silently expand the fix** beyond the reviewed item.
- **Do not squash or rebase** as part of this workflow.

---

## Edge cases

**Multiple review items to fix:**  
Fix and commit them one at a time unless the user explicitly asks you to batch them. Atomic commits are easier to revert.

**Fix requires changes across many files:**  
Implement all files in one commit (they are one logical change), but list all modified files in the confirmation output.

**Fix conflicts with current branch state:**  
Surface the conflict to the user. Do not attempt a merge or rebase without explicit instruction.

**Linting or tests fail after the fix:**  
Stop. Report the failure with output. Do not commit broken code.

**User provides the fix themselves:**  
If the user writes the code and just wants you to commit it, skip to step 4 (verify) and proceed to commit.

---

## Example trigger

```
/accept-review
The null check on line 42 — add the guard and commit it.
```

Or, following a `pr-review-analyze` session:
```
Go ahead and accept item 2 — implement and commit.
```