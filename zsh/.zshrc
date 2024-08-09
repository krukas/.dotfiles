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
alias c=calc

# Aliases for running node versions with docker
function run_docker_node {
  docker container run --rm -it -v $(pwd):/app --workdir /app --user 1000:1000 node:$1-bookworm-slim ${@:2}
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
function n22 {
  run_docker_node 22 $@
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

# Auto zellij tab names
zellij_tab_name_update() {
  if [[ -n $ZELLIJ ]]; then
    tab_name=''
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        tab_name+=$(basename "$(git rev-parse --show-toplevel)")/
        tab_name+=$(git rev-parse --show-prefix)
        tab_name=${tab_name%/}
    else
        tab_name=$PWD
            if [[ $tab_name == $HOME ]]; then
         	tab_name="~"
             else
         	tab_name=${tab_name##*/}
             fi
    fi
    command nohup zellij action rename-tab $tab_name >/dev/null 2>&1
  fi
}
zellij_tab_name_update
chpwd_functions+=(zellij_tab_name_update)


eval "$(starship init zsh)"

