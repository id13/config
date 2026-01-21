starship init fish | source
zoxide init fish | source
direnv hook fish | source

fzf --fish | source

fish_ssh_agent

set fish_greeting

# if $HOME/.secrets.fish exists then source it
if test -f $HOME/.secrets.fish
    source $HOME/.secrets.fish
end

# Add newline after command output
function postexec_newline --on-event fish_postexec
    echo
end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
