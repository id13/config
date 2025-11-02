# @fish-lsp-disable 2002
# Filesystem
# alias cd='z'
alias ..='cd ..' # Go up one directory
alias ...='cd ../..' # Go up two directories
alias ....='cd ../../..' # And for good measure
alias ls='eza --icons=always'
alias ll='ls -la' # Long view, no hidden

# Misc
alias tf='terraform'
alias d="kitten diff"
alias grep='grep --color=auto'
alias vim='nvim'
alias less='less -R'
alias edit='vim'
alias sftp='with-readline sftp'
alias icat='kitten icat'
alias top='btop'
alias glow='glow -t'
