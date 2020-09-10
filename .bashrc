# .bashrc

# User specific aliases and functions
alias rebash='source ~/.bashrc'
alias ebash='vim ~/.bashrc'
alias vimrc='vim ~/.vimrc'
alias ll='ls -lrtha'
alias publicip="curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'"
alias tmux='tmux -2'
alias tma='tmux -2 attach -t'
alias tmn='tmux -2 new -s'
alias ta="tmux attach -t"
alias tree='tree -I "node_modules"'
alias grep='grep --color=auto -r'

dockimg() {
  docker ps | grep "$1" | awk '{ print $1 }'
}

dockbash() {
  docker exec -it $(docker ps -aqf "name=$1") bash;
}

removecontainers() {
    docker stop $(docker ps -aq)
    docker rm $(docker ps -aq)
}

destory-all-dockers() {
    docker stop $(docker ps -aq)
    docker rm $(docker ps -aq)
    docker network prune -f
    docker rmi -f $(docker images --filter dangling=true -qa)
    docker volume rm $(docker volume ls --filter dangling=true -q)
    docker rmi -f $(docker images -qa)
}

export PS1="\u@\h \w> ";
export PATH="/usr/local/sbin:/Users/gcongdon/.local/lib/python3.6/site-packages:/Users/gcongdon/anaconda3/bin:/Applications/Splunk/bin:$PATH"

