# Empty the Trash
alias emptytrash="rm -rfv ~/.Trash"

# Recursively delete `.DS_Store` files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"

# Show/hide hidden files in Finder
alias show='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hide='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# Disable Spotlight
alias spotoff="sudo mdutil -a -i off"
# Enable Spotlight
alias spoton="sudo mdutil -a -i on"

function ideaDiff
  /Applications/IntelliJ\ IDEA.app/Contents/MacOS/idea diff $argv[1] $argv[2]
end
