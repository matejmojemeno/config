alias xclip="xclip -sel c"
alias dc="docker-compose"
alias fnlock="echo 0 | sudo tee /sys/module/hid_apple/parameters/fnmode"
alias vim="nvim"
alias open="xdg-open"
alias killssh="ps aux | grep sshfs | head -n 1 | awk '{print \$2}' | xargs kill -9"

# Wezterm
alias wezterm="flatpak run org.wezfurlong.wezterm"
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
