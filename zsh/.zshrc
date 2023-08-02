export ZSH=$HOME/.oh-my-zsh

# Disable ZSH theme
ZSH_THEME=""

plugins=(git docker docker-compose)

source $ZSH/oh-my-zsh.sh

# Setup fzf
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--prompt '∷ ' \
--pointer ▶"


# User configuration
eval "$(starship init zsh)"