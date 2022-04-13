#!/bin/bash

DOTFILES=$HOME/.dotfiles

git clone https://github.com/voischev/dotfiles.git $DOTFILES

cd $DOTFILES

cd $HOME
rm -rf                          .vim
ln -s $DOTFILES/vim/            .vim
ln -s $DOTFILES/vimrc           .vimrc
ln -s $DOTFILES/bash_profile    .bash_profile
ln -s $DOTFILES/gitignore       .gitignore
ln -s $DOTFILES/tmux            .tmux.conf
