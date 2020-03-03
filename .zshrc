# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/gcongdon/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  jira
  docker
  salesforce-cli-zsh-completion
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# User specific aliases and functions
alias ebash='vim ~/.zshrc'
alias rebash='source ~/.zshrc'
alias vimrc='vim ~/.vimrc'
alias ll='ls -lrtha'
alias publicip="curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'"
alias tmux='tmux -2'
alias tma='tmux -2 attach -t'
alias tmn='tmux -2 new -s'
alias ta="tmux attach -t"
alias tree='tree -I "node_modules"'
alias grep='grep --color=auto -r'
alias dc="docker-compose "
alias preview="open Preview "
alias gtags="ctags -V -R --maxdepth=3 --exclude='*.css' --exclude='*.min.js' --exclude='*.json' --exclude='*-min.js' *"
alias conda2="/Users/gcongdon/anaconda2/bin/conda"
alias tmio="networksetup -setairportnetwork en0 TMIO_Wireless"
alias amaze="networksetup -setairportnetwork en0 AMAZE_Wireless"
alias mm="rsync -raz --exclude='package.xml' --exclude='.git'--progress  ~/mavensmate/avisgrady/src/ ~/omni-channel/nozen/src"
alias mn="rsync -raz --exclude='package.xml' --progress --dry-run ~/omni-channel/nozen/src ~/mavensmate/avisgrady/src/"
alias sshconfig="vim ~/.ssh/config"
alias nib='node --inspect-brk'
alias pmd='~/Downloads/pmd-bin-6.17.0/bin/run.sh pmd'

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

api() {
  cd ~/colossus/api
  export FLASK_DEBUG=1
  FLASK_APP=api.py flask run
}

countchar() {
    while IFS= read -r i; do printf "%s" "$i" | tr -dc "$1" | wc -m; done
}

rcc() {
  git clone https://github.com/rockconnections/$1.git
}

buildDeploy() {
  PREV=$1
  CURR=$2
  TARG=$3
  cd ~/rockconnections/omni-channel
  ./nozen/src/scripts/buildAndPrep.py -p $PREV -v $CURR --awsprofile prod --skip-rebase 
  ./nozen/src/scripts/deploy.py -v $CURR -t $TARG
}

buildDeployWithRebase() {
  PREV=$1
  CURR=$2
  TARG=$3
  cd ~/rockconnections/omni-channel
  ./nozen/src/scripts/buildAndPrep.py -p $PREV -v $CURR --awsprofile prod --skip-destructive-changes
  ./nozen/src/scripts/deploy.py -v $CURR -t $TARG
}

buildFixDeploy() {
  PREV=$1
  CURR=$2
  TARG=$3
  cd ~/rockconnections/omni-channel
  ./nozen/src/scripts/buildAndPrep.py -p $PREV -v $CURR
  cd ./releases/$CURR
  code ./releaseData.json ./ant_deploy/package.xml && cd ~/omni-channel
  ./nozen/src/scripts/deploy.py -v $CURR -t $TARG
}

buildCheck() {
  PREV=$1
  CURR=$2
  TARG=$3
  cd ~/rockconnections/omni-channel
  ./nozen/src/scripts/buildAndPrep.py -p $PREV -v $CURR
  cd ./releases/$CURR
  code ./releaseData.json ./ant_deploy/package.xml
}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="/usr/local/bin:/Library/Java/JavaVirtualMachines/jdk1.8.0_191.jdk/Contents/Home/bin:/usr/local/sbin:/Users/gcongdon/.local/lib/python3.6/site-packages:$PATH"
export PATH="$HOME/.jenv/bin:/usr/local/sonar-scanner-4.0.0.1744-macosx/bin:$PATH"
export M2_HOME="/usr/local/Cellar/maven/3.6.0"
export RIPGREP_CONFIG_PATH="/Users/gcongdon/.ripgreprc"
eval "$(jenv init -)"
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

alias python=python3
alias pip=pip3

alias mig='cd /Users/gcongdon/MigrationSFDX'
alias migfa='cd /Users/gcongdon/MigrationSFDX/force-app/main/default'
alias uf='cd ../../../../../'
alias omni='cd ~/rockconnections/omni-channel'
alias nz='cd ~/rockconnections/omni-channel/nozen/src'
alias rels='cd ~/rockconnections/omni-channel/releases'

alias errUniq="jq '.result[] | .error ' | sort | uniq"
alias jq-deploy="jq '.result[] | {error: .error, filePath: .filePath}'"

alias dx:push='sfdx force:source:push'
alias dx:pull='sfdx force:source:pull'
alias dx:create='sfdx force:org:create -s -f config/project-scratch-def.json -a '
alias dx:create:push='sfdx force:org:create -s -f config/project-scratch-def.json && dxpush'
alias dx:set:prod='sfdx force:config:set defaultusername=gradycongdon@rockconnections.com'
alias dx:open='sfdx force:org:open'
alias dx:cc='sfdx force:apex:test:run --codecoverage --resultformat human'

dx:test(){
  sfdx force:apex:test:run | awk -F'"' '$0=$2' | zsh
}
dx:testc(){
  dx:cc | awk -F'"' '$0=$2' | zsh
}

pullMeta() {
  META=$1
  ALIAS=${2:-migration} #param2 or fallback to 'migration' sandbox
  PKG_TEMP='<?xml version="1.0" encoding="UTF-8"?> <Package xmlns="http://soap.sforce.com/2006/04/metadata"> <types> <name>METAMETA</name> <members>*</members> </types> <version>47.0</version> </Package>'
  XML=package_$META.xml
  touch $XML
  echo "$PKG_TEMP" > $XML
  sed -i.bak "s/METAMETA/$META/g" $XML
  rm $XML.bak
  sfdx force:mdapi:retrieve --unpackaged $XML -r $META --targetusername $ALIAS --usetoolingapi
  mv $XML $META/
  cd $META
  unzip unpackaged.zip
  sfdx force:mdapi:convert -r unpackaged
  rm unpackaged.zip
  mv force-app/main/default/* ./force-app
  rm -r force-app/main
  cd ..
}

cpMeta() {
  set -eux
  META=$1
  cd $META/force-app
  DIR=$(ls -d -- */) 
  cp -r $DIR ../../force-app/main/default/$DIR
  cd ../..
}

omniMeta() {
  DIR=$1
  TEMP=temporary
  mkdir $TEMP
  cp ~/omni/$DIR/* ./$TEMP
  cd $TEMP
  rename -a "-meta.xml" *
  cd ..
  mv ./$TEMP/* force-app/$1/
  rmdir $TEMP
}


SFDX_USE_PROGRESS_BAR=true
# sfdx autocomplete setup
SFDX_AC_ZSH_SETUP_PATH=/Users/gcongdon/Library/Caches/sfdx/autocomplete/zsh_setup && test -f $SFDX_AC_ZSH_SETUP_PATH && source $SFDX_AC_ZSH_SETUP_PATH;
