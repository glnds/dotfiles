# Language Default
set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

set -x PATH "$HOME/bin" $PATH

# add homebrew to the beginning of PATH
set -x PATH "/usr/local/bin" $PATH
set -x PATH "/usr/local/sbin" $PATH
set -x PATH "/usr/texbin" $PATH

# Groovy home
set -x GROOVY_HOME /usr/local/opt/groovy/libexec

# Gradle home
set -x GRADLE_HOME /usr/local/Cellar/gradle/2.6

# Java home
#set -x JAVA_HOME $(/usr/libexec/java_home -v 1.8)

# MongoDB
set -x PATH /usr/local/mongodb-2.6.4/bin $PATH

# ruby
# setup rbenv (from https://gist.github.com/2937920)
set -x PATH "$HOME/.rbenv/bin" $PATH
set -x PATH "$HOME/.rbenv/shims" $PATH
# to make Ruby faster http://tmm1.net/ruby21-rgengc/?utm_source=rubyweekly&utm_medium=email
set -x  RUBY_GC_HEAP_INIT_SLOTS 600000
set -x  RUBY_GC_HEAP_FREE_SLOTS 600000
set -x  RUBY_GC_HEAP_GROWTH_FACTOR 1.25
set -x  RUBY_GC_HEAP_GROWTH_MAX_SLOTS 300000

# python
set -x PATH "/usr/local/share/python" $PATH

# go
set -x GOPATH "$HOME/go"
set -x PATH "$GOPATH/bin" $PATH

# respect local bins
set -x PATH "./bin" $PATH

# editor
set -x EDITOR "vim"

# grep colors
setenv -x GREP_OPTIONS "--color=auto"
