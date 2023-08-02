export ZSH=$HOME/.oh-my-zsh

# Disable ZSH theme
ZSH_THEME=""

plugins=(git docker docker-compose)

source $ZSH/oh-my-zsh.sh


# User configuration
eval "$(starship init zsh)"