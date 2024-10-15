alias xclip="xclip -sel c"
alias dc="docker-compose"
alias fnlock="echo 0 | sudo tee /sys/module/hid_apple/parameters/fnmode"
alias vim="nvim"
alias open="xdg-open"
alias killssh="ps aux | grep sshfs | head -n 1 | awk '{print \$2}' | xargs kill -9"
alias anki="flatpak run net.ankiweb.Anki"
alias kc="nvim ~/.config/kitty/kitty.conf"

# Wezterm
# alias wezterm="flatpak run org.wezfurlong.wezterm"
# Rename current worskpace
alias wrename="wezterm cli rename-workspace"

# Conda
alias act="conda activate"
alias deact="conda deactivate"

# Bat
if which bat > /dev/null; then
  alias cat="bat"
fi

# Github Copilot CLI
alias suggest="gh copilot suggest"
alias explain="gh copilot explain"

# Zoxide
if which zoxide > /dev/null; then
    alias cd="z"
fi

# Fancy ls
if which lsd > /dev/null; then
  alias ls="lsd --group-directories-first"
  alias la="lsd -lah --group-directories-first"
  alias ll="lsd -lh --group-directories-first"
fi

# Obsidian
# set vault path
export VAULT="$HOME/vault/repo"
alias oo='cd $VAULT'
alias or='vim $VAULT/*.md'

# Count files in a directory
count() {
    if [ -z "$1" ]; then
        /usr/bin/ls -l | wc -l
    else
        /usr/bin/ls -l "$1" | wc -l
    fi
}

v() {
    if [ -z "$1" ]; then
        nvim
    else
        z "$1" && nvim
    fi
}
