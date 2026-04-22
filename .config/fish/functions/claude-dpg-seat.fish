function claude-dpg-seat --description 'Launch Claude Code using seat dpg'
    set -lx CLAUDE_CONFIG_DIR $HOME/.claude-dpg
    command claude $argv
end
