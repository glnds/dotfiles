# Dotfiles

Personal dotfiles for a terminal-based dev environment on macOS.

## Core Stack

- **Fish** shell (`.config/fish/`)
- **Neovim** via LazyVim (`.config/nvim/`)
- **tmux** terminal multiplexer (`.tmux.conf`)
- **Ghostty** terminal emulator (`.config/ghostty/`)


## Directory Structure

```text
.config/
  fish/        # shell config, aliases, exports, utils
  nvim/        # LazyVim-based neovim config
  tmux.conf    # multiplexer config (in repo root)
  ghostty/     # terminal emulator config
  git/         # git config
  gh/          # GitHub CLI config
```


## Fish Config

- `config.fish` — main config, sources aliases/exports/utils
- `aliases.fish` — aliases and shell functions
- `export.fish` — environment variables and PATH
- `secrets.fish` — local secrets (not tracked)
- tmux auto-starts inside Ghostty terminal
