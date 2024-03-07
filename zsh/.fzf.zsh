export FZF_DEFAULT_COMMAND='find .'

# Setup fzf
# ---------
if [[ ! "$PATH" == */home/matej/.config/zsh/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/matej/.config/zsh/fzf/bin"
fi

# Auto-completion
# ---------------
source "/home/matej/.config/zsh/fzf/shell/completion.zsh"

# Key bindings
# ------------
source "/home/matej/.config/zsh/fzf/shell/key-bindings.zsh"
