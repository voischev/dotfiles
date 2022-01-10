#!/bin/bash

# Зависимости
sudo apt-get install build-essential libssl-dev

# Последняя версия https://cmake.org/download/
wget https://github.com/Kitware/CMake/releases/download/v3.22.1/cmake-3.22.1.tar.gz
tar -zxvf cmake-3.22.1.tar.gz
cd cmake-3.22.1

./bootstrap
make
sudo make install

rm -rf cmake-3.22.1
