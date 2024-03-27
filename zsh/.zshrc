# Exports
export PATH="$PATH:/opt/julia/bin:/home/matej/.local/bin:/usr/local/go/bin:/home/matej/.cargo/bin"
export XDG_DATA_DIRS="/var/lib/flatpak/exports/share:/home/matej/.local/share/flatpak/exports/share:$XDG_DATA_DIRS"
export EDITOR="/usr/bin/nvim"


#Unique history search
setopt HIST_IGNORE_DUPS


# Aliases
source ~/.config/zsh/aliases.zsh


# Plugins
source ~/.config/zsh/plugins.zsh


# Deleting and moving by whole words
# HACK: Ctrl+Backspace sends Ctrl+b in Wezterm so it can work in neovim
bindkey "^B" backward-delete-word
# bindkey "^H" backward-delete-word
local WORDCHARS=${WORDCHARS//[^a-zA-Z]/}
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word


# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history


# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# zstyle ':completion:*:files:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# compdef '_files -g "*"' bat


# Powelevel10k
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh//.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh


# fzf
[ -f ~/.config/zsh/.fzf.zsh ] && source ~/.config/zsh/.fzf.zsh


# zoxide
source ~/.config/zsh/zoxide.sh


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/matej/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/matej/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/matej/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/matej/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

