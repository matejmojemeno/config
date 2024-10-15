export FZF_DEFAULT_COMMAND="fd . -H"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"

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
