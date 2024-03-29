#!/bin/bash

source /opt/rh/devtoolset-11/enable
gcc --version
g++ --version
cmake --version

wget -c https://github.com/llvm/llvm-project/releases/download/llvmorg-17.0.6/llvm-project-17.0.6.src.tar.xz
tar xf llvm-project-17.0.6.src.tar.xz
cd llvm-project-17.0.6.src && mkdir build && cd build
source /opt/rh/devtoolset-11/enable
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$HOME/llvm -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra" -G "Unix Makefiles" ../llvm
make -j
echo "------------------------------------------------------------------"
ldd $HOME/llvm/bin/clang
echo "------------------------------------------------------------------"
ldd $HOME/llvm/bin/clangd
