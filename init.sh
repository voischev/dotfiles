#!/bin/bash

# Brew
brew update
# Install more recent versions of some OS X tools
brew install vim --override-system-vi
brew install ack
brew install homebrew/versions/node4-lts
brew install tree

# Remove outdated versions from the cellar.
brew cleanup

# Dotfiles init
export DOTFILES=$HOME/.dotfiles

# VIM
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Configs
ln -s $DOTFILES/profile         $HOME/.profile
ln -s $DOTFILES/vimrc           $HOME/.vimrc
ln -s $DOTFILES/jscsrc          $HOME/.jscsrc
ln -s $DOTFILES/jshintrc        $HOME/.jshintrc
ln -s $DOTFILES/jshintignore    $HOME/.jshintignore
ln -s $DOTFILES/gitignore       $HOME/.gitignore

# GIT configuration
git config --global core.excludesfile ~/.gitignore
