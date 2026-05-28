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
function gd
    nvim -c "DiffviewOpen $argv"
end
alias edit='vim'
alias sftp='with-readline sftp'
alias icat='kitten icat'
alias top='btop'
alias glow='glow -t'

# Dust GCP aliases
alias dust-us='gcloud config configurations activate us-central1 && gcloud container clusters get-credentials dust-kube --region us-central1'
alias dust-eu='gcloud config configurations activate europe-west1 && gcloud container clusters get-credentials dust-kube --region europe-west1'

# dust-hive
alias dhs="dust-hive spawn -C -c \"claude --dangerously-skip-permissions\""
alias dho="dust-hive open -C"
alias dhl="dust-hive list"
alias dhd="dust-hive destroy"
alias dhw="dust-hive warm"
alias dhc="dust-hive cool"
alias dh="dust-hive"
alias gs="git-spice"
