#!/bin/bash

source /opt/rh/devtoolset-11/enable
gcc --version
g++ --version
cmake --version

wget -c https://github.com/llvm/llvm-project/releases/download/llvmorg-15.0.0/llvm-project-15.0.0.src.tar.xz
tar xf llvm-project-15.0.0.src.tar.xz
cd llvm-project-15.0.0.src && mkdir build && cd build
scl enable devtoolset-11 bash
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$HOME/llvm -DLLVM_ENABLE_RTTI=ON -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra" -G "Unix Makefiles" ../llvm
make -j
