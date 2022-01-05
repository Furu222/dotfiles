#!/bin/bash

wd=~/dotfiles # set working directory(default: ~/dotfiles)
ctdir=${wd}/commit_template # if change directory name, change .gitconfig.

ln -s ${wd}/.bash_profile ~/.bash_profile
ln -s ${wd}/.bashrc ~/.bashrc
ln -s ${wd}/.gvimrc ~/.gvimrc
ln -s ${wd}/.tmux.conf ~/.tmux.conf
ln -s ${wd}/.vim ~/.vim
ln -s ${wd}/.vimrc ~/.vimrc
ln -s ${wd}/.gitconfig ~/.gitconfig
ln -s ${wd}/.inputrc ~/.inputrc

# mkdir vim directory
mkdir ${wd}/.vim/swap
mkdir ${wd}/.vim/undo
mkdir ${wd}/.vim/backup

# set & refresh git commit template
if [ ! -d  ${ctdir} ]; then
  git clone https://gist.github.com/24e2ccd109b7b6a2f20dff7485b24f56.git ${ctdir}
fi

cd ${ctdir}
git pull origin master
