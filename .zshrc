# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.

# LC_CTYPE=en_US.UTF-8
# LC_ALL=en_US.UTF-8

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
unsetopt CORRECT                      # Disable autocorrect guesses. Happens when typing a wrong
                                      # command that may look like an existing one.

expand-or-complete-with-dots() {      # This bunch of code displays red dots when autocompleting
  echo -n "\e[31m......\e[0m"         # a command with the tab key, "Oh-my-zsh"-style.
  zle expand-or-complete
  zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots
# Directories
zstyle ':completion:*:default' list-colors ''

source $HOME/.zshenv
if which pyenv > /dev/null; then eval "$(pyenv init --path)"; fi

if [[ -s "${HOME}/.rvm/scripts/rvm" ]]; then
	source $HOME/.rvm/scripts/rvm
fi

if [[ -s "${HOME}/.cargo/env" ]]; then
	source $HOME/.cargo/env  # This loads rust
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

eval "$(direnv hook zsh)"

source $HOME/.zshfunc


# Force colemak on graphic apps
if [ -s '/home/jd/colemak-1.0' ]; then eval "setxkbmap us; xmodmap /home/jd/colemak-1.0/xmodmap/xmodmap.colemak && xset r 66"; fi


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
export PATH="/opt/homebrew/opt/protobuf@21/bin:$PATH"
eval "$(zoxide init zsh)"
