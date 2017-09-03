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
# source ~/.secret_keys

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
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

if [[ -s "${HOME}/.rvm/scripts/rvm" ]]; then
	source $HOME/.rvm/scripts/rvm
fi

if [ -e /Users/jd/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/jd/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
eval "$(direnv hook zsh)"

source $HOME/.zshfunc
