#!/bin/bash

# Зависимости
sudo apt-get cmake install build-essential libssl-dev

# Последняя версия https://cmake.org/download/
wget https://github.com/Kitware/CMake/releases/download/v3.20.2/cmake-3.20.2.tar.gz
tar -zxvf cmake-3.20.2.tar.gz
cd cmake-3.20.2

./bootstrap
make
sudo make install

rm -rf cmake-3.20.2
