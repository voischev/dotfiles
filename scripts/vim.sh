#!/bin/bash

# Актуально для Ubuntu server

# Удалить старые версии vim
sudo apt-get remove vim vim-runtime gvim vim-tiny vim-common vim-gui-common \
vim-nox gvim

sudo apt-get update
sudo apt-get upgrade

# Установить зависимости

sudo apt-get install libncurses-dev

# Сборка vim c github.com

cd && \
mkdir vimtemp && cd vimtemp && \
git clone https://github.com/vim/vim.git && \
cd vim

make clean
make distclean

./configure \
--with-features=huge \
--enable-luainterp=dynamic \
--enable-python3interp \
--with-python3-command=python3 \
--enable-largefile \
--with-compiledby="ivan Voischev <voischev-ivan@ya.ru>"

make -j4 VIMRUNTIMEDIR=/usr/local/share/vim/vim82
sudo make install

sudo update-alternatives --install /usr/bin/editor editor  /usr/local/bin/vim 1
sudo update-alternatives --set editor /usr/bin/vim editor  /usr/local/bin/vim
sudo update-alternatives --install /usr/bin/vim vim  /usr/local/bin/vim 1
update-alternatives --list vim
