# $HOME/.config/fish/env.fish
# Fish shell environment variables configuration
# Source this file in your config.fish: source $HOME/.config/fish/env.fish

# =============================================================================
# PATH Configuration
# =============================================================================

# Add custom directories to PATH
fish_add_path -g $HOME/bin
fish_add_path -g $HOME/.local/bin
fish_add_path -g /usr/local/bin
fish_add_path -g $HOME/.cargo/bin
fish_add_path -g /opt/homebrew/bin

# =============================================================================
# Development Tools
# =============================================================================

# Node.js
set -gx NODE_ENV development
set -gx NPM_CONFIG_PREFIX $HOME/.npm-global
fish_add_path -g $HOME/.npm-global/bin

# Python
set -gx PYTHONDONTWRITEBYTECODE 1
set -gx PYTHONUNBUFFERED 1
set -gx VIRTUAL_ENV_DISABLE_PROMPT 1
set -gx PIPENV_VENV_IN_PROJECT 1

# Go
set -gx GOPATH $HOME/go
set -gx GOBIN $GOPATH/bin
fish_add_path -g $GOBIN

# Rust
set -gx RUST_BACKTRACE 1
set -gx CARGO_HOME $HOME/.cargo

# Ruby
set -gx GEM_HOME $HOME/.gems
set -gx BUNDLE_PATH $HOME/.gems
fish_add_path -g $GEM_HOME/bin

# Java
set -gx JAVA_HOME /usr/lib/jvm/java-17-openjdk
# For macOS: set -gx JAVA_HOME (/usr/libexec/java_home -v 17)

# Android
set -gx ANDROID_HOME /Users/jd/Library/Android/sdk
fish_add_path -g $ANDROID_HOME/emulator
fish_add_path -g $ANDROID_HOME/tools
fish_add_path -g $ANDROID_HOME/tools/bin
fish_add_path -g $ANDROID_HOME/platform-tools

# Editor and Terminal
# =============================================================================

# Default editors
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx SUDO_EDITOR nvim

# Terminal
set -gx TERM xterm-256color
set -gx COLORTERM truecolor

# Less pager options
set -gx LESS '-R -F -X --mouse'
set -gx LESSHISTFILE $HOME/.lesshst
set -gx LESSCHARSET utf-8

# Man pages with color
set -gx MANPAGER "nvim +Man!"
# Alternative: set -gx MANPAGER "less -R --use-color -Dd+r -Du+b"

set -gx EZA_CONFIG_DIR "$HOME/.config/eza"

# =============================================================================
# XDG Base Directory Specification
# =============================================================================

set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_STATE_HOME $HOME/.local/state
set -gx XDG_CACHE_HOME $HOME/.cache

# =============================================================================
# Application-specific Settings
# =============================================================================

# Docker
set -gx DOCKER_BUILDKIT 1
set -gx COMPOSE_DOCKER_CLI_BUILD 1

# Git
set -gx GIT_EDITOR $EDITOR

# FZF (Fuzzy Finder)
set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -gx FZF_DEFAULT_OPTS '--height 40% --layout=reverse --border --preview "bat --style=numbers --color=always {}"'

# Bat (better cat)
set -gx BAT_THEME TwoDark
set -gx BAT_STYLE "numbers,changes,header"

# Ripgrep
set -gx RIPGREP_CONFIG_PATH $HOME/.config/ripgrep/config

# GPG
set -gx GPG_TTY (tty)

# SSH
set -gx SSH_AUTH_SOCK $HOME/.ssh/agent.sock

# =============================================================================
# Locale and Language
# =============================================================================

set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8
set -gx LC_CTYPE en_US.UTF-8
set -gx LANGUAGE en_US:en

# =============================================================================
# Security and Privacy
# =============================================================================

# Disable telemetry for various tools
set -gx DOTNET_CLI_TELEMETRY_OPTOUT 1
set -gx HOMEBREW_NO_ANALYTICS 1
set -gx GATSBY_TELEMETRY_DISABLED 1
set -gx NEXT_TELEMETRY_DISABLED 1
set -gx NUXT_TELEMETRY_DISABLED 1

# =============================================================================
# Fish-specific Settings
# =============================================================================

# Fish greeting (empty to disable)
set -gx fish_greeting ""

# Fish syntax highlighting colors
set -gx fish_color_command green
set -gx fish_color_param cyan
set -gx fish_color_error red
set -gx fish_color_quote yellow
set -gx fish_color_comment brblack

# =============================================================================
# Conditional Environment Variables
# =============================================================================

# OS-specific settings
switch (uname)
    case Linux
        set -gx OS_TYPE linux
        # Linux-specific vars
    case Darwin
        set -gx OS_TYPE macos
        # macOS-specific vars
        set -gx HOMEBREW_PREFIX /opt/homebrew
    case '*BSD'
        set -gx OS_TYPE bsd
        # BSD-specific vars
end

# =============================================================================
# Functions for Dynamic Environment Variables
# =============================================================================

# Example: Set project-specific env vars when entering directory
function __auto_source_env --on-variable PWD
    if test -f .env.fish
        source .env.fish
    end
end

# =============================================================================
# Debugging
# =============================================================================

# Uncomment for debugging
# set -gx DEBUG 1
# set -gx VERBOSE 1

# =============================================================================
# Notes
# =============================================================================

# To reload this file:
# source $HOME/.config/fish/env.fish

# To see all environment variables:
# env | sort

# To see fish-specific variables:
# set -S

# To make a variable available to child processes, use -x (export):
# set -x VAR_NAME value

# To make a variable global (available in all fish sessions), use -g:
# set -g VAR_NAME value

# To make a variable universal (persisted across restarts), use -U:
# set -U VAR_NAME value

# To remove a variable:
# set -e VAR_NAME
