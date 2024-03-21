export ZSH=$HOME/.oh-my-zsh

# Disable ZSH theme
ZSH_THEME=""

plugins=(command-not-found git docker docker-compose fzf extract colored-man-pages)

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
alias ls='eza --icons --group-directories-first -a'

# Aliases for running node versions with docker
function run_docker_node {
  docker container run --rm -it -v $(pwd):/app --workdir /app --user 1000:1000 node:$1-buster-slim ${@:2}
}
function n14 {
  run_docker_node 14 $@
}
function n16 {
  run_docker_node 16 $@
}
function n18 {
  run_docker_node 18 $@
}
function n20 {
  run_docker_node 20 $@
}

# Projects shortcuts
function p {
  cd $(find ~/Projects -maxdepth 1 |  fzf)
}
function pedit {
  # TODO: Maybe run this in tmux/zellij session with project name as session name for reconnect
  p
  helix .
}

# User configuration
eval "$(starship init zsh)"

