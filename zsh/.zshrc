export ZSH=$HOME/.oh-my-zsh

# Disable ZSH theme
ZSH_THEME=""

plugins=(command-not-found git docker docker-compose fzf extract)

source $ZSH/oh-my-zsh.sh

# Setup fzf
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--prompt '∷ ' \
--pointer ▶"

# Custom aliases
alias hx=helix

# User configuration
eval "$(starship init zsh)"
