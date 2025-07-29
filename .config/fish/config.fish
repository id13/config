starship init fish | source
zoxide init fish | source
direnv hook fish | source

fzf --fish | source

set fish_greeting

# Add newline after command output
function postexec_newline --on-event fish_postexec
    echo
end
