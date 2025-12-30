---
description: Generate a commit message for staged changes
---

Analyze the staged changes using `git diff --staged` and generate a clear, concise commit message following conventional commit format.

## Instructions

1. Run `git diff --staged` to see the changes
2. Analyze what was changed and why
3. Generate a commit message with:
   - Type: feat|fix|docs|style|refactor|test|chore
   - Scope (optional): affected component
   - Subject: imperative mood, lowercase, no period
   - Body (if needed): explain what and why

## Example output

```
feat(auth): add JWT token refresh mechanism

- Implement automatic token refresh before expiration
- Add refresh token storage in secure cookie
- Handle refresh failures with logout redirect
```
