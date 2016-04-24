# Language Default
set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

# set -x PYTHONPATH "/usr/local/lib/python2.7/site-packages"

# Groovy home
set -x GROOVY_HOME /usr/local/opt/groovy/libexec

# Gradle home
set -x GRADLE_HOME /usr/local/opt/gradle/libexec
set -x GRADLE_OPTS "-Dorg.gradle.daemon=true"

# Java home
set -x JAVA_HOME (/usr/libexec/java_home -v 1.8)

# Maven home
set -x M2_HOME /usr/local/opt/maven/libexec

# Go Home
set -x GOPATH "$HOME/go"

# MongoDB
set -x PATH /usr/local/mongodb-2.6.4/bin $PATH

# go
set -x PATH "$GOPATH/bin" $PATH

# ruby
# setup rbenv (from https://gist.github.com/2937920)
set -x PATH "$HOME/.rbenv/bin" $PATH
set -x PATH "$HOME/.rbenv/shims" $PATH
# to make Ruby faster http://tmm1.net/ruby21-rgengc/?utm_source=rubyweekly&utm_medium=email
set -x  RUBY_GC_HEAP_INIT_SLOTS 600000
set -x  RUBY_GC_HEAP_FREE_SLOTS 600000
set -x  RUBY_GC_HEAP_GROWTH_FACTOR 1.25
set -x  RUBY_GC_HEAP_GROWTH_MAX_SLOTS 300000

#set -x PYTHONPATH "/usr/local/lib/python2.7/site-packages"

# Google Cloud
set -x PATH "$HOME/google-cloud-sdk/bin" $PATH

# Add Ansible developer version to the beginning of PATH
#set -x PATH "/Users/glnds/Sources/ansible/bin" $PATH

set -x PATH "$HOME/bin" $PATH

# Add homebrew to the beginning of PATH
set -x PATH "/usr/local/bin" $PATH
set -x PATH "/usr/local/sbin" $PATH

# respect local bins
set -x PATH "./bin" $PATH

# editor
set -x EDITOR "vim"

# grep colors
setenv -x GREP_OPTIONS "--color=auto"

# Oracle
set -x ORACLE_HOME "/opt/oracle/product/instantclient_64/11.2.0.4.0"
set -x PATH "$ORACLE_HOME/bin" $PATH
set -x DYLD_LIBRARY_PATH "$ORACLE_HOME/lib"
