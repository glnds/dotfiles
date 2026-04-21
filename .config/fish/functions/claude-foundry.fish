function claude-foundry --description 'Launch Claude Code using Azure Foundry'
    set -l api_key (security find-generic-password -s anthropic-foundry -a $USER -w 2>/dev/null)
    if test -z "$api_key"
        echo "No Foundry API key in Keychain (service: anthropic-foundry)."
        echo "Store one with:"
        echo "  security add-generic-password -a \$USER -s anthropic-foundry -U -w"
        return 1
    end

    set -lx CLAUDE_CODE_USE_FOUNDRY 1
    set -lx ANTHROPIC_FOUNDRY_API_KEY $api_key
    set -lx ANTHROPIC_FOUNDRY_RESOURCE foundry-individual
    set -lx ANTHROPIC_DEFAULT_SONNET_MODEL claude-sonnet-4-7
    set -lx ANTHROPIC_DEFAULT_HAIKU_MODEL claude-haiku-4-5
    set -lx ANTHROPIC_DEFAULT_OPUS_MODEL claude-opus-4-6

    claude $argv
end
