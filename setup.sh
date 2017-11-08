#!/bin/bash

apt-get install -y tmux || yum install tmux

mv ~/.vimrc ~/.vimrc.bak
mv ~/.tmux.conf ~/.tmux.conf.bak
mv ~/.gitconfig ~/.gitconfig.bak

cp /.vimrc ~/.vimrc 
cp ./.tmux.conf ~/.tmux.conf 
cp ./.gitconfig ~/.gitconfig 

mkdir -p ~/.vim/monokai
git clone https://github.com/sickill/vim-monokai.git ~/.vim/monokai
mv ~/.vim/monokai/colors ~/.vim/
rm -rf ~/.vim/monokai

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl --insecure -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

git clone https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrlp
git clone https://github.com/vim-syntastic/syntastic.git  ~/.vim/bundle/syntastic
git clone https://github.com/easymotion/vim-easymotion ~/.vim/bundle/vim-easymotion
git clone https://github.com/scrooloose/nerdcommenter.git ~/.vim/bundle/nerdcommenter

git clone https://github.com/pangloss/vim-javascript.git ~/.vim/bundle/vim-javascript
git clone https://github.com/elzr/vim-json.git ~/.vim/bundle/vim-json

