# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=
#PS1='[\u@\e[38;5;202m\h \e[m\W]\$'

PATH=$PATH:/home/cent/phantomjs/bin

# User specific aliases and functions
alias yummy='sudo yum -y install'
alias bashp='vim ~/.bashrc'
alias rebash='source ~/.bashrc'
alias vimrc='vim ~/.vimrc'
alias ll='ls -lrtha'
alias tu='tmux a -t usual'
alias wown='sudo chown nginx:nginx'
alias wopn='sudo chmod 770'
alias publicip="curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'"
alias glc="grunt less-compile"
alias tmux='tmux -2'
alias operm="stat -c '%A %a %n'"

