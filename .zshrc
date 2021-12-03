export ZSH=/Users/gcongdon/.oh-my-zsh

ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

alias find-latest='find . -type f -exec stat -f "%m %N" "{}" \; | sort -nr | head'
alias ebash='vim ~/.zshrc && rebash'
alias rebash='source ~/.zshrc'
alias vimrc='vim ~/.vimrc'
alias ll='ls -lrtha'
alias publicip="curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'"
alias tree='tree -I "node_modules"'
alias grep='grep --color=auto -r'
alias preview="open Preview "
alias localip='ipconfig getifaddr en0'
alias ci='code-insiders'
alias mozjpeg='npx @squoosh/cli --mozjpeg '"'"'{"quality":75,"baseline":false,"arithmetic":false,"progressive":true,"optimize_coding":true,"smoothing":0,"color_space":3,"quant_table":3,"trellis_multipass":false,"trellis_opt_zero":false,"trellis_opt_table":false,"trellis_loops":1,"auto_subsample":true,"chroma_subsample":2,"separate_chroma_quality":false,"chroma_quality":75}'"'"''
alias oxipng='npx @squoosh/cli --oxipng '"'"'{"level":2}'"'"''

export LOCAL_IP=$(ipconfig getifaddr en0)
export VPN_IP='10.93.53.186'
export RIPGREP_CONFIG_PATH="/Users/gcongdon/.ripgreprc"
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

destroy-all-dockers() {
    docker stop $(docker ps -aq)
    docker rm $(docker ps -aq)
    docker network prune -f
    docker rmi -f $(docker images --filter dangling=true -qa)
    docker volume rm $(docker volume ls --filter dangling=true -q)
    docker rmi -f $(docker images -qa)
}

docker-pop() {
  ID=$(docker ps | awk '{ print $1 }'| head -2 | tail -1)
  echo $ID
  docker stop $ID
}

docker-stop() {
  docker stop $(docker ps -q)
}

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
# Vi style:
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
