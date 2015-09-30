# Flush Directory Service cache
alias flush="dscacheutil -flushcache"

# Empty the Trash
alias emptytrash="rm -rfv ~/.Trash"

# Recursively delete `.DS_Store` files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"

# Show/hide hidden files in Finder
alias show='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hide='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false and killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true and killall Finder"

# Disable Spotlight
alias spotoff="sudo mdutil -a -i off"
# Enable Spotlight
alias spoton="sudo mdutil -a -i on"

alias damn="sudo (history | head -1)" #reapplies the last command with sudo

function fuck -d 'Correct your previous console command'
    set -l exit_code $status
    set -l eval_script (mktemp 2>/dev/null ; or mktemp -t 'thefuck')
    set -l fucked_up_commandd $history[1]
    thefuck $fucked_up_commandd > $eval_script
    . $eval_script
    rm $eval_script
    if test $exit_code -ne 0
        history --delete $fucked_up_commandd
    end
end

function ideaDiff
  /Applications/IntelliJ\ IDEA\ 14.app/Contents/MacOS/idea diff $argv[1] $argv[2]
end
