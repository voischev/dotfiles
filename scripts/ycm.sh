#!/bin/bash

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
cd -
