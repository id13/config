# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

function list_all() {
    ls -a
}

chpwd_functions=(${chpwd_functions[@]} "list_all")

source ~/.alias # aliases
source ~/.mvn_colors # mvn-colors
source ~/.less_colors # less-colors
source ~/.bindkeys
source ~/.secret_keys

unsetopt nomatch

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

source $HOME/.rvm/scripts/rvm
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:/usr/local/bin"
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export PATH=$PATH:$GOPATH/bin
export MANPATH="/usr/local/man:$MANPATH"
export ARCHFLAGS="-arch x86_64"
export SSH_KEY_PATH="~/.ssh/id_rsa"
export USER="jd"
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export JAVA_HOME=`/usr/libexec/java_home`
export PYTHON_CONFIGURE_OPTS="--enable-framework"
export EDITOR="vim"
export TERM="xterm-256color"

