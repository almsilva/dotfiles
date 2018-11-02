#!/bin/sh
echo "Setting environment variables..."
echo "export CXX=/usr/bin/clang++" >> ~/.bash_profile
echo "export CC=/usr/bin/clang" >> ~/.bash_profile
echo "export LINT=/usr/bin/clang-tidy" >> ~/.bash_profile
source ~/.bash_profile
