#!/bin/bash

# Dotfiles init
export DOTFILES=$HOME/.dotfiles

# VIM
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Configs
ln -s $DOTFILES/profile         $HOME/.bash_profile
ln -s $DOTFILES/vimrc           $HOME/.vimrc
ln -s $DOTFILES/ackrc           $HOME/.ackrc
ln -s $DOTFILES/gitignore       $HOME/.gitignore
ln -s $DOTFILES/tmux            $HOME/.tmux.conf
