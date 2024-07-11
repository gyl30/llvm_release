#!/bin/bash

echo "------------------------------------------------------------------"
source /opt/rh/devtoolset-11/enable
gcc --version
g++ --version
cmake --version
echo "------------------------------------------------------------------"

git clone https://github.com/llvm/llvm-project
cd llvm-project


GIT_TAG=$(git describe --tags `git rev-list --tags --max-count=1`)
echo "------------------------------------------------------------------"
echo "git checkout ${GIT_TAG}"
echo "------------------------------------------------------------------"
git checkout ${GIT_TAG}

mkdir build && cd build && cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$HOME/llvm -DLLVM_ENABLE_PROJECTS="clang;lld;lldb;clang-tools-extra" LLVM_ENABLE_RUNTIMES=all -G "Unix Makefiles" ../llvm 

make -j`nproc` && make install && cd .. && rm -rf build
