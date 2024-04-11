#!/bin/bash

INSTALL_PATH=$HOME/FAST-DDS   #install  path

CURRENT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# #install  foonathan_memory_vendor
# cd  thirdparty/foonathan_memory_vendor
# mkdir build 
# rm -rf build/*
# cd build
# echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++in to $(pwd)"
# cmake .. -DCMAKE_INSTALL_PREFIX=$INSTALL_PATH -DBUILD_SHARED_LIBS=ON
# cmake --build . --target install


#install Fast-CDR
cd $CURRENT_PATH
cd  thirdparty/fastcdr
mkdir build 
rm -rf build/*
cd build
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++in to $(pwd)"
cmake .. -DCMAKE_INSTALL_PREFIX=$INSTALL_PATH 
cmake --build . --target install


#install fastdds
cd $CURRENT_PATH
mkdir build 
rm -rf build/*
cd build
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++in to $(pwd)"
cmake ..  -DCMAKE_INSTALL_PREFIX=$INSTALL_PATH 
cmake --build . --target install