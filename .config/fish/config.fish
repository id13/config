starship init fish | source
zoxide init fish | source
direnv hook fish | source

fzf --fish | source

set fish_greeting

# if $HOME/.secrets.fish exists then source it
if test -f $HOME/.secrets.fish
    source $HOME/.secrets.fish
end

# Add newline after command output
function postexec_newline --on-event fish_postexec
    echo
end
