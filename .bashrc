# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=
#PS1='[\u@\e[38;5;202m\h \e[m\W]\$'

PATH=$PATH:/home/cent/phantomjs/bin
PATH=$PATH:/usr/local/go/bin
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
PATH=$PATH:$GOROOT/bin
export DOCKER_API_VERSION=1.21
echo docker version: $DOCKER_API_VERSION

# User specific aliases and functions
alias yummy='sudo yum -y install'
alias bashp='vim ~/.bashrc'
alias rebash='source ~/.bashrc'
alias ebash='vim ~/.bashrc'
alias vimrc='vim ~/.vimrc'
alias ll='ls -lrtha'
alias tu='tmux a -t usual'
alias wown='sudo chown nginx:nginx'
alias wopn='sudo chmod 770'
alias publicip="curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'"
alias glc="grunt less-compile"
alias tmux='tmux -2'
alias tma='tmux -2 attach -t'
alias tmn='tmux -2 new -s'
alias operm="stat -c '%A %a %n'"
alias node5="/usr/local/n/versions/node/5.4.1/bin/node"
alias nge="sudo vim /etc/nginx/conf.d/sites.conf"
alias ngrl="sudo service nginx reload"
alias ngr="sudo service nginx restart"
alias ngs="systemctl status nginx.service"
alias ta="tmux attach -t"
alias tree='tree -I "node_modules"'
alias python='python3'
alias py='python3'
alias pyman='python3 manage.py'


export PERL_LOCAL_LIB_ROOT="$PERL_LOCAL_LIB_ROOT:/home/cent/perl5";
export PERL_MB_OPT="--install_base /home/cent/perl5";
export PERL_MM_OPT="INSTALL_BASE=/home/cent/perl5";
export PERL5LIB="/home/cent/perl5/lib/perl5:$PERL5LIB";
export PATH="/home/cent/perl5/bin:$PATH";
export GOOGLE_APPLICATION_CREDENTIALS="/usr/share/nginx/www/biblio/ocr/api-key.json";

export PATH="$HOME/.yarn/bin:$PATH"
