# Dotfiles

Personal dotfiles for a terminal-centric dev environment on macOS.

## Fresh Mac setup

From an out-of-the-box Apple Silicon Mac to a working environment. Run the steps in order: later
steps depend on earlier ones.

> [!IMPORTANT]
> This repo is public. Keys, tokens, and machine-specific identity config never go in it.
> Everything marked **(untracked)** below is created by hand or copied from the old machine over
> a trusted channel (AirDrop, encrypted USB, Migration Assistant for `~/.ssh` only).

### Step 1: command line tools + Homebrew

```console
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"   # current zsh session only; fish config handles it later
```

### Step 2: SSH key for GitHub (untracked)

`.gitconfig` rewrites `https://github.com/` to SSH, so **every** GitHub clone after the symlink
step (LazyVim plugins, tmux plugins, your repos) needs a working key first.

```console
ssh-keygen -t ed25519 -C "<email>"                # set a passphrase
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
pbcopy < ~/.ssh/id_ed25519.pub                    # add at github.com/settings/keys
ssh -T git@github.com                             # accept host key, expect "Hi <user>!"
```

Also restore from the old machine, if used:

- `~/.ssh/config`: host aliases for extra GitHub accounts (see `url.*.insteadOf` in `.gitconfig`)
- `~/.gitconfig-*`: identity overrides pulled in by `includeIf` in `.gitconfig`

### Step 3: clone + bootstrap

```console
git clone https://github.com/glnds/dotfiles.git ~/dotfiles
cd ~/dotfiles
brew install mise      # one-time, seeds the task runner
mise trust             # this repo's .mise.toml defines the tasks
mise run bootstrap
```

`bootstrap` runs sequentially:

1. `install`: `brew bundle` (Brewfile)
2. `link`: symlinks `.gitconfig`, `.tmux`, `.tmux.conf`, `.config` into `$HOME`. Fails instead of
   nesting when a real file/dir is in the way, so move any pre-existing `~/.config` aside first
3. `mise install`: every mise-managed tool
4. `alacritty-update`: Alacritty from the upstream dmg (the Homebrew cask is disabled)
5. `tpm`: clones the tmux plugin manager and installs the tmux plugins
6. `hk install`: git hooks for this repo

Idempotent, so it's safe to re-run. Available tasks: `mise tasks`.

> [!TIP]
> If the shell ever reports `mise: Unknown command`, mise itself is gone —
> re-seed it with `brew install mise`. `update` can't recover this: it runs
> `brew upgrade` (installed formulae only), not `brew bundle`.

### Step 4: fish as default shell

```console
sudo bash -c 'echo /opt/homebrew/bin/fish >> /etc/shells'
chsh -s /opt/homebrew/bin/fish
```

Open Alacritty: fish starts and tmux auto-attaches to session `main`. Refresh completions once with
`fish_update_completions`.

### Step 5: secrets + accounts (untracked)

- `~/.config/fish/secrets.fish`: local env secrets, gitignored, sourced if present
- `gh auth login` for each GitHub account, then per-directory `GH_TOKEN` (see
  [GitHub Multi-Account](#github-multi-account))
- `~/.claude/settings.json`: Claude Code settings + tmux bell hooks (see
  [tmux Notifications](#tmux-notifications-for-claude-code))

### Step 6: nvim

Open nvim: [LazyVim](https://www.lazyvim.org/) auto-installs plugins on first launch (needs the
SSH key from step 2).

### Step 7: macOS approvals

LuLu, BlockBlock, and Malwarebytes each need their system extension / Full Disk Access approved
under System Settings → Privacy & Security on first launch.

### Step 8: Obsidian

Sign in to iCloud and let iCloud Drive finish syncing the vault (the `sb` alias points at it),
then open it in Obsidian: vault settings and community plugins live inside the vault, so they
come along. Enable the CLI under Settings → General → Command line interface so `ob` works.

## Tool Management

Two layers: [brew](https://brew.sh/) bootstraps the system,
[mise](https://mise.jdx.dev/) handles everything else.

```text
┌─ brew ────────────────────────────────────────────────────────────┐
│  Bootstrap only: git, mise, fish, neovim, tmux + GUI casks        │
└───────────────────────────┬───────────────────────────────────────┘
                            │ brew bundle (one time)
                            ▼
┌─ mise ────────────────────────────────────────────────────────────┐
│  Everything else, two scopes:                                     │
│                                                                   │
│   GLOBAL                          PER-REPO                        │
│   ~/.config/mise/conf.d/*.toml    <repo>/.mise.toml               │
│   ──────                          ──────                          │
│   Always available                Active only when cwd is         │
│   starship, atuin, rg, bat,       inside that repo                │
│   fd, eza, jq, uv, rumdl, ...       dotfiles → hk, pkl,           │
│                                                trufflehog         │
│                                     attracr  → python, node, uv, │
│                                                ruff, hk, sam, …   │
└───────────────────────────────────────────────────────────────────┘
```

### Brew (system foundation)

`Brewfile` covers what must exist before mise runs, plus GUI casks and
formulae with no good mise plugin:

- Bootstrap: `git`, `mise`
- Shell/editor: `fish`, `neovim`, `luarocks`, `tmux`
- Utilities: `trash`, `tree`, `btop` (no aqua-registry darwin/arm64 build)
- Casks: nerd fonts, Finch, MarkEdit, Handy, Obsidian, LuLu, BlockBlock,
  KnockKnock, Malwarebytes

> [!NOTE]
> Editing the `Brewfile` does nothing on its own. Only `brew bundle` reconciles
> it — run `mise run install` (or `mise run bootstrap`) to apply new entries.
> `update` runs `brew upgrade`, which only upgrades already-installed formulae
> and never installs what you just added.
>
> Pruning the other direction — after moving a tool from brew to mise — run
> `brew bundle cleanup --force`. It uninstalls formulae/casks not in the
> `Brewfile` (plus their orphaned deps), so the brew copy stops shadowing the
> mise shim. `brew leaves` should then equal the `Brewfile`.

### Global mise tools

Declared in `.config/mise/conf.d/*.toml`, all pinned to `latest`. Available
in every shell, no matter the cwd:

- `20-shell.toml` — starship, atuin, zoxide, fzf
- `30-cli.toml` — claude, gh, jq, ripgrep, bat, fd, eza, glow, dust, yazi,
  gitui, delta, rumdl, uv, cship, ccusage

### Per-repo mise tools

Each repo ships its own `.mise.toml` declaring tools specific to that
project. This repo's pins `hk`, `pkl`, and `trufflehog` — useless outside
the dotfiles repo (git hook runner, its config language, secret scanner
called from the pre-commit hook). Other repos pin what they need: a
Python project pins `python` + `uv` + `ruff`; an AWS project pins
`aws-sam-cli` + `cfn-lint` + `cfn-guard`. When you `cd` into the repo,
mise puts those tools on PATH; when you leave, they're gone.

```console
$ cd ~                  # no .mise.toml in scope
$ hk --version
mise ERROR No version is set for shim: hk

$ cd ~/dotfiles         # .mise.toml declares hk
$ hk --version
hk 1.46.0
```

**Why this matters:**

- **No global pollution.** A project pinned to Python 3.11 doesn't fight
  another pinned to 3.13. Each has its own `.mise.toml`; both Just Work.
- **Reproducible across machines.** `.mise.toml` is in git, so a fresh
  clone gets the exact same versions after `mise install`.
- **Fast onboarding.** Clone, `mise install`, done — no chasing down which
  tools the project expects.

### Why mise (over plain brew/asdf/pyenv/nvm/...)

- One declarative tool for languages and CLIs — add a tool by editing one
  toml line, commit, done
- Fast installs from precompiled binaries via the aqua registry
- Auto-install on first use; no `brew install` round trips
- Versions live in git, so machines stay in sync

## Updating

Single command, runs brew + mise + uv in one go:

```console
update           # fish wrapper
mise run update  # equivalent
```

Defined in `.config/mise/conf.d/99-tasks.toml`, the task chains:

1. `brew update && brew upgrade && brew cleanup`
2. `mise upgrade` — re-resolves `latest` pins and installs newer versions
3. `mise prune` — removes the now-unused old versions
4. `uv tool upgrade --all` — upgrades Python tools installed via `uv tool`

## Tools

### Shell and Terminal

- **[fish](https://fishshell.com/)** — shell with autosuggestions and
  syntax highlighting
- **[starship](https://starship.rs/)** — fast, customizable cross-shell
  prompt
- **[atuin](https://atuin.sh/)** — SQLite-backed shell history with
  fuzzy search
- **[tmux](https://github.com/tmux/tmux)** — terminal multiplexer
- **[Alacritty](https://alacritty.org/)** — GPU-accelerated terminal
  emulator (`Cmd+Shift+M` to toggle maximize)

### Editor

- **[Neovim](https://neovim.io/)** — modal editor
  ([LazyVim](https://www.lazyvim.org/) config)

### CLI Replacements

- **[bat](https://github.com/sharkdp/bat)** — `cat` with syntax
  highlighting
- **[eza](https://eza.rocks/)** — modern `ls` replacement
- **[fd](https://github.com/sharkdp/fd)** — fast `find` alternative
- **[dust](https://github.com/bootandy/dust)** — visual `du`
  replacement
- **[ripgrep](https://github.com/BurntSushi/ripgrep)** — fast `grep`
  alternative
- **[fzf](https://github.com/junegunn/fzf)** — fuzzy finder
- **[zoxide](https://github.com/ajeetdsouza/zoxide)** — smarter `cd`
- **[trash](https://hasseg.org/trash/)** — safe `rm` to trash can

### Git

- **[git](https://git-scm.com/)** — latest Homebrew-managed version
- **[delta](https://github.com/dandavison/delta)** — syntax-highlighted
  git diffs with side-by-side view
- **[gitui](https://github.com/extrawurst/gitui)** — lightweight terminal
  Git UI (aliased as `tig`)
- **[gh](https://cli.github.com/)** — GitHub CLI
- **[hk](https://github.com/jdx/hk)** — per-repo git hook runner
  (config in `hk.pkl`, install with `hk install`). On Git 2.54+ hooks are
  config-based, not scripts in `.git/hooks/` — so an empty `.git/hooks/` is
  expected. Verify with `git config --get-regexp '^hook\.'`, not `ls
  .git/hooks/`.

### Containers

- **[Finch](https://github.com/runfinch/finch)** — open-source container
  tool (Docker alternative)

> AWS tooling (`aws-cli`, `aws-sam-cli`, `cfn-lint`, `cfn-guard`) lives in
> each AWS project's `.mise.toml`, not globally.

### Utilities

- **[jq](https://jqlang.github.io/jq/)** — JSON processor
- **[btop](https://github.com/aristocratos/btop)** — system monitor
  with CPU, memory, disk, network, and GPU stats
- **[yazi](https://yazi-rs.github.io/)** — fast terminal file manager
- **[glow](https://github.com/charmbracelet/glow)** — terminal Markdown
  renderer
- **[tree](https://oldmanprogrammer.net/source.php?dir=projects/tree)**
  — directory listing
- **[rumdl](https://rumdl.dev/)** — fast Markdown linter (CLI + LSP for
  nvim)
- **[uv](https://github.com/astral-sh/uv)** — fast Python package manager
- **[Handy](https://handy.computer/)** — offline speech-to-text dictation
  app (Whisper), types transcribed text into any app
- **[Obsidian](https://obsidian.md/)** — Markdown knowledge base; vault syncs via iCloud,
  CLI linked by the cask as `obsidian` (`ob`, `sb` aliases)

### Security

- **[LuLu](https://objective-see.org/products/lulu.html)** — open-source
  firewall, blocks unknown outgoing connections
- **[BlockBlock](https://objective-see.org/products/blockblock.html)** —
  monitors persistence locations (launch daemons, login items)
- **[KnockKnock](https://objective-see.org/products/knockknock.html)** —
  scans for persistently installed software
- **[Malwarebytes](https://www.malwarebytes.com/mac)** — on-demand malware
  scanner

> [TruffleHog](https://github.com/trufflesecurity/trufflehog) (secret
> scanner) lives in each hk-enabled repo's `.mise.toml`, called from the
> pre-commit hook — see this repo's `hk.pkl` for an example.

## Custom Shortcuts

### Yazi folder favorites

| Keys | Directory       |
|------|-----------------|
| `gs` | `~/source`      |
| `gk` | `~/Desktop`     |
| `gd` | `~/Downloads`   |
| `go` | `~/Documents`   |

## tmux Notifications for Claude Code

tmux `monitor-activity` is too noisy for Claude Code (fires on every
output line). Instead, bell-based notifications trigger only when
Claude needs input.

**How it works:** Claude Code hooks send a terminal bell (`\a`) on
`Stop` and `permission_prompt` events → tmux `monitor-bell`
highlights the window name in the status bar (bold red).

The hooks are configured in `~/.claude/settings.json` (not tracked
in this repo).

## GitHub Multi-Account

The `gh` CLI supports multiple accounts natively (v2.40+). Combined with
mise `[env]`, account switching is automatic per directory.

### Step 1: authenticate both accounts

```console
gh auth login  # private account
gh auth login  # work account (stacks)
```

Verify with `gh auth status`.

### Step 2: per-directory `GH_TOKEN` via mise (untracked)

<!-- rumdl-disable MD013 -->

Put a `mise.toml` at the root of each account's directory tree. It lives **outside** this repo:
it resolves a token at runtime and never stores one.

`~/source/mise.toml` (private, default for everything under `~/source`):

```toml
[env]
GH_TOKEN = "{{ exec(command='/bin/sh -c \"$HOME/.local/share/mise/installs/gh/latest/*/bin/gh auth token --user <private-user>\"') }}"
```

`~/source/<work>/mise.toml` (overrides it for work repos):

```toml
[env]
GH_TOKEN = "{{ exec(command='/bin/sh -c \"$HOME/.local/share/mise/installs/gh/latest/*/bin/gh auth token --user <work-user>\"') }}"
```

<!-- rumdl-enable MD013 -->

Then `mise trust` inside each folder. `GH_TOKEN` overrides `gh auth switch`, so gh uses the right
account based on working directory. Re-auth an account and the token updates on the next shell
entry.

> [!WARNING]
> Call the real gh binary by path, as above — never plain `gh`. gh is mise-managed, so `gh` is
> a mise shim, and invoking a shim from inside a mise `exec()` template deadlocks.
