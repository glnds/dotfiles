# macmini: finish mise/hk migration

Handoff plan, verified against the working reference machine. Feed this to Claude Code on macmini.

## Context

Migrating git-hook management to [hk](https://github.com/jdx/hk) (via mise), dropping the old
git-secrets setup. Two leftovers flagged on macmini:

1. No active pre-commit hook (commits not scanned).
2. Orphaned `secrets.*` keys in global git config from the old git-secrets install.

**Key insight:** on Git 2.54+, `hk install` writes config-based hooks (`hook.hk-*.command` in the
repo's git config), **not** scripts in `.git/hooks/`. So an empty `.git/hooks/` is NOT proof of
missing hooks — the correct check is `git config --get-regexp '^hook\.'`. The reference machine has
exactly these entries locally and a clean global config.

## Steps

### 1. Confirm prerequisites

```bash
git --version          # need 2.54+ for config-based hooks
cd ~/dotfiles
mise install           # ensures hk, pkl, trufflehog present
mise ls | grep -E 'hk|pkl|trufflehog'
```

### 2. Install hk hooks

```bash
cd ~/dotfiles
mise run bootstrap     # install + link + mise install + hk install
# (or just: hk install)
```

No `--global` = per-repo, matching the reference machine. `.git/hooks/` staying empty is expected.

### 3. Verify hooks the correct way

```bash
git config --local --get-regexp '^hook\.'   # expect hook.hk-pre-commit.* and hook.hk-pre-push.*
```

Optional: stage a dummy file with a fake secret, confirm trufflehog blocks the commit, then unstage.

### 4. Clean orphaned global git-secrets config

```bash
git config --global --get-regexp secrets       # inspect first
git config --global --remove-section secrets   # removes providers/patterns/allowed in one shot
git config --global --get-regexp secrets        # confirm empty
git config --global --get core.hooksPath        # confirm unset
```

## Done when

- `git config --local --get-regexp '^hook\.'` lists the hk pre-commit/pre-push entries.
- `git config --global --get-regexp secrets` returns nothing.

## Reference machine state (for comparison)

```console
$ git --version
git version 2.54.0

$ git config --local --get-regexp '^hook\.'
hook.hk-pre-commit.command   test "${HK:-1}" = "0" || hk run pre-commit --from-hook "$@"
hook.hk-pre-commit.event     pre-commit
hook.hk-pre-push.command     test "${HK:-1}" = "0" || hk run pre-push --from-hook "$@"
hook.hk-pre-push.event       pre-push

$ git config --global --get-regexp secrets
(none)

$ mise ls | grep -E 'hk|pkl|trufflehog'
hk          1.46.0
pkl         0.31.1
trufflehog  3.95.5
```

## Note

This mirrors the per-repo setup. hk also supports `hk install --global` (no-op in repos without an
`hk.pkl`) to cover every repo automatically — a different choice from what's on the reference machine.
