# Dotfiles

Personal dotfiles for a terminal-centric dev environment on macOS.

## Installation

### Prerequisites

- [Homebrew](https://brew.sh/) installed
- `git` installed

### Step 1: clone

```console
cd ~
git clone https://github.com/glnds/dotfiles.git
```

### Step 2: bootstrap

```console
cd ~/dotfiles
brew install mise      # one-time, seeds the task runner
mise run bootstrap     # everything else
```

`bootstrap` chains: `brew bundle` (Brewfile) → symlinks into `$HOME` →
`mise install` (all mise-managed tools) → `hk install` (per-repo git
hooks from `hk.pkl`). Idempotent — safe to re-run.

Mise-managed tools also auto-install on first use
(`not_found_auto_install = true` in `.config/mise/config.toml`). Available
tasks: `mise tasks`.

### Step 3: change shell

Make [fish](https://github.com/fish-shell/fish-shell/) your default shell:

```console
sudo bash -c 'echo /opt/homebrew/bin/fish >> /etc/shells'
chsh -s /opt/homebrew/bin/fish
```

Periodically update fish completions:

```console
fish_update_completions
```

### Step 4: prepare nvim

Open nvim — [LazyVim](https://www.lazyvim.org/) auto-installs plugins on
first launch.

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
│   fd, eza, jq, uv, rumdl,           dotfiles → hk, pkl            │
│   trufflehog, ...                   attracr  → python, node,      │
│                                                uv, ruff, hk, ...  │
└───────────────────────────────────────────────────────────────────┘
```

### Brew (system foundation)

`Brewfile` covers what must exist before mise runs, plus GUI casks and
formulae with no good mise plugin:

- Bootstrap: `git`, `mise`
- Shell/editor: `fish`, `neovim`, `luarocks`, `tmux`, `direnv`
- Utilities: `trash`, `tree`, `btop` (no aqua-registry darwin/arm64 build)
- Casks: Alacritty, nerd fonts, Finch, MarkEdit, LuLu, BlockBlock, KnockKnock,
  Malwarebytes

### Global mise tools

Declared in `.config/mise/conf.d/*.toml`, all pinned to `latest`. Available
in every shell, no matter the cwd:

- `20-shell.toml` — starship, atuin, zoxide, fzf
- `30-cli.toml` — claude, gh, jq, ripgrep, bat, fd, eza, glow, dust, yazi,
  gitui, delta, rumdl, uv
- `50-security.toml` — trufflehog

### Per-repo mise tools

Each repo can ship a `.mise.toml` declaring tools specific to that project.
This repo's `.mise.toml` for example pins `hk` and `pkl` — tools that only
make sense inside this repo (git hook runner + its config language). When
you `cd` into the repo, mise puts them on PATH; when you leave, they're
gone.

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
- **[lazygit](https://github.com/jesseduffield/lazygit)** — terminal
  Git UI with interactive rebase
- **[gitui](https://github.com/extrawurst/gitui)** — lightweight
  terminal Git UI
- **[gh](https://cli.github.com/)** — GitHub CLI
- **[hk](https://github.com/jdx/hk)** — per-repo git hook runner
  (config in `hk.pkl`, install with `hk install`)

### Containers and Cloud

- **[Finch](https://github.com/runfinch/finch)** — open-source container
  tool (Docker alternative)
- **[awscli](https://aws.amazon.com/cli/)** — AWS CLI
- **[aws-sam-cli](https://github.com/aws/aws-sam-cli)** — serverless
  application model CLI
- **[cfn-lint](https://github.com/aws-cloudformation/cfn-lint)** —
  CloudFormation linter
- **[cloudformation-guard](https://github.com/aws-cloudformation/cloudformation-guard)**
  — policy-as-code for CloudFormation

### Utilities

- **[jq](https://jqlang.github.io/jq/)** — JSON processor
- **[btop](https://github.com/aristocratos/btop)** — system monitor
  with CPU, memory, disk, network, and GPU stats
- **[yazi](https://yazi-rs.github.io/)** — fast terminal file manager
- **[glow](https://github.com/charmbracelet/glow)** — terminal Markdown
  renderer
- **[tree](https://oldmanprogrammer.net/source.php?dir=projects/tree)**
  — directory listing
- **[direnv](https://direnv.net/)** — per-directory environment variables
- **[rumdl](https://rumdl.dev/)** — fast Markdown linter (CLI + LSP for
  nvim)
- **[uv](https://github.com/astral-sh/uv)** — fast Python package manager

### Security

- **[LuLu](https://objective-see.org/products/lulu.html)** — open-source
  firewall, blocks unknown outgoing connections
- **[BlockBlock](https://objective-see.org/products/blockblock.html)** —
  monitors persistence locations (launch daemons, login items)
- **[KnockKnock](https://objective-see.org/products/knockknock.html)** —
  scans for persistently installed software
- **[Malwarebytes](https://www.malwarebytes.com/mac)** — on-demand malware
  scanner
- **[TruffleHog](https://github.com/trufflesecurity/trufflehog)** — scans
  repos for leaked credentials

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
direnv, account switching is automatic per directory.

### Step 1: authenticate both accounts

```console
gh auth login  # work account
gh auth login  # private account (stacks)
```

Verify with `gh auth status`.

### Step 2: automatic per-directory switching with direnv

Create `.envrc` in each repos root:

Work repos (`~/work/.envrc`):

```bash
export GH_TOKEN=$(gh auth token --user your-work-username 2>/dev/null)
```

Private repos (`~/personal/.envrc`):

```bash
export GH_TOKEN=$(gh auth token --user your-private-username 2>/dev/null)
```

Then `direnv allow` inside each folder.

`GH_TOKEN` overrides `gh auth switch`, so gh automatically uses the right
account based on working directory — mirroring how SSH config works.
The `2>/dev/null` variant dynamically pulls the current stored token
rather than a hardcoded value.

**Caveat:** if you re-auth an account, the token updates automatically
since the `.envrc` evaluates `gh auth token` on each shell entry.
