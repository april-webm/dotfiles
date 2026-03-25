# Fish Shell Configuration

# Disable greeting
set fish_greeting

# Initialize Starship prompt
starship init fish | source

# Fetch on interactive session
if status is-interactive
    fastfetch  # hyfetch if you prefer, install either
end

# ===================================
# PATH Configuration
# ===================================
fish_add_path $HOME/.local/bin
fish_add_path /usr/local/bin
# Mac-only (ignored if doesn't exist)
test -d /opt/homebrew/bin; and fish_add_path /opt/homebrew/bin

# ===================================
# Aliases
# ===================================
alias ls="eza --icons"    # modern ls replacement
alias ll="eza -lah --icons"
alias la="eza -A --icons"
alias l="eza --icons"
alias tree="eza --tree --icons"

# Git shortcuts
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git log --oneline --graph --decorate"

# Quick navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias c="clear"

# ===================================
# Environment Variables
# ===================================
set -gx EDITOR nvim
set -gx VISUAL nvim

# ===================================
# Fish colors
# ===================================
set fish_color_normal normal
set fish_color_command blue
set fish_color_quote green
set fish_color_redirection cyan
set fish_color_end magenta
set fish_color_error red
set fish_color_param normal
set fish_color_comment brblack
set fish_color_match cyan
set fish_color_selection white --bold --background=brblack
set fish_color_search_match bryellow --background=brblack
set fish_color_operator cyan
set fish_color_escape brcyan
set fish_color_autosuggestion brblack

# ===================================
# Custom Functions
# ===================================
function mkcd
    mkdir -p $argv[1]
    cd $argv[1]
end

function gcm
    git commit -m "$argv"
end

function extract
    if test -f $argv[1]
        switch $argv[1]
            case '*.tar.bz2'; tar xjf $argv[1]
            case '*.tar.gz'; tar xzf $argv[1]
            case '*.bz2'; bunzip2 $argv[1]
            case '*.rar'; unrar x $argv[1]
            case '*.gz'; gunzip $argv[1]
            case '*.tar'; tar xf $argv[1]
            case '*.tbz2'; tar xjf $argv[1]
            case '*.tgz'; tar xzf $argv[1]
            case '*.zip'; unzip $argv[1]
            case '*.Z'; uncompress $argv[1]
            case '*.7z'; 7z x $argv[1]
            case '*'; echo "'$argv[1]' cannot be extracted"
        end
    else
        echo "'$argv[1]' is not a valid file"
    end
end

# Opam (if installed)
test -r "$HOME/.opam/opam-init/init.fish"; and source "$HOME/.opam/opam-init/init.fish" > /dev/null 2>/dev/null
