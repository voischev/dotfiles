#!/bin/bash

DOTFILES=$HOME/.dotfiles

git clone https://github.com/voischev/dotfiles.git $DOTFILES

# Зависимости 
sudo apt-get install cmake python3-dev lua5.2 liblua5.2-0

cd $DOTFILES
git submodule update --remote --merge

# Пример удаления модулей
#git submodule deinit vim/pack/plugins/start/vim-airline
#git rm vim/pack/plugins/start/vim-airline
#rm -rf .git/modules/vim/pack/plugins/start/vim-airline
#git commit

# YouCompleteMe
cd vim/pack/plugins/start/YouCompleteMe
git submodule update --init --recursive
./install.py --ts-completer

cd $HOME
rm -rf                          .vim
ln -s $DOTFILES/vim/            .vim
ln -s $DOTFILES/vimrc           .vimrc
ln -s $DOTFILES/bash_profile    .bash_profile
ln -s $DOTFILES/ackrc           .ackrc
ln -s $DOTFILES/gitignore       .gitignore
ln -s $DOTFILES/tmux            .tmux.conf
ln -s $DOTFILES/ctags           .ctags

