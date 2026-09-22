# `uv tool install` drops shims in ~/.local/bin, so it must be on PATH.
# Self-contained on purpose: the standalone uv installer writes
# ~/.local/bin/env.fish and only exists on machines installed that way.
# uv comes from mise here, so sourcing that file errors on a fresh install.
if not contains "$HOME/.local/bin" $PATH
    set -x PATH "$HOME/.local/bin" $PATH
end
