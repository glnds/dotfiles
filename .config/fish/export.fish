# Language Default
set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

# set -x PATH /usr/local/opt/python/libexec/bin $PATH
# set -x PYTHONPATH "/usr/local/lib/python3.6/site-packages"
set -x PATH ~/Library/Python/3.7/bin $PATH
# set -x PATH /Library/Frameworks/Python.framework/Versions/3.7/bin $PATH
# set -x PATH ~/Library/Python/3.7/bin $PATH

# Rust config
set -x PATH "$HOME/.cargo/bin" $PATH

# tmux fix
set -x export EVENT_NOKQUEUE=1
# set -x TERM xterm-256color

# Autossh
set -x AUTOSSH_PORT 0

# Packer config, use dpp-build as default boto profile
set -x AWS_PROFILE "masl"
set -x PACKER_LOG 1
set -x PACKER_LOG_PATH "packer.log"

# Groovy home
set -x GROOVY_HOME /usr/local/opt/groovysdk/libexec

# Gradle home
set -x GRADLE_HOME /usr/local/opt/gradle/libexec
set -x GRADLE_OPTS "-Dorg.gradle.daemon=true"

# Java home
set -x JAVA_HOME (/usr/libexec/java_home -v 1.8)
# jenv
set -x PATH $HOME/.jenv/bin $PATH

# Maven home
set -x M2_HOME /usr/local/opt/maven/libexec
set -x  MAVEN_OPTS "-Xmx1024M -XX:MaxPermSize=256m"

# Go
set -x GOPATH "$HOME/go"
set -x GOBIN "$GOPATH/bin"
set -x PATH "$GOPATH/bin" $PATH

# JMeter
if test -e /opt/apache-jmeter-3.0/bin
  set -x PATH "/opt/apache-jmeter-3.0/bin" $PATH
end

# ruby
# setup rbenv (from https://gist.github.com/2937920)
# set -x PATH "$HOME/.rbenv/bin" $PATH
# set -x PATH "$HOME/.rbenv/shims" $PATH
# to make Ruby faster http://tmm1.net/ruby21-rgengc/?utm_source=rubyweekly&utm_medium=email
set -x  RUBY_GC_HEAP_INIT_SLOTS 600000
set -x  RUBY_GC_HEAP_FREE_SLOTS 600000
set -x  RUBY_GC_HEAP_GROWTH_FACTOR 1.25
set -x  RUBY_GC_HEAP_GROWTH_MAX_SLOTS 300000

# Google Cloud
if test -e "$HOME/google-cloud-sdk/bin"
  set -x PATH "$HOME/google-cloud-sdk/bin" $PATH
end

set -x PATH "/Applications/Alacritty.app/Contents/MacOS" $PATH

# Add Ansible developer version to the beginning of PATH
#set -x PATH "/Users/glnds/Sources/ansible/bin" $PATH

# Add homebrew to the beginning of PATH
set -x PATH "/usr/local/bin" $PATH

# respect local bins
set -x PATH "./bin" $PATH

# editor
set -x EDITOR "vim"

# grep colors
setenv GREP_OPTIONS "--color=auto"

# Oracle
if test -e /opt/oracle/product/instantclient_64/11.2.0.4.0
  set -x ORACLE_HOME "/opt/oracle/product/instantclient_64/11.2.0.4.0"
  set -x PATH "$ORACLE_HOME/bin" $PATH
  set -x DYLD_LIBRARY_PATH "$ORACLE_HOME/lib"
end

set -g fish_user_paths "/usr/local/opt/mongodb@3.4/bin" $fish_user_paths
