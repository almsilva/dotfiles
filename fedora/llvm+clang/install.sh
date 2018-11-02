#!/bin/sh
# This script will setup the LLVM/CLANG based C++ development environment.
# It includes:
#
# * CMake
# * LLVM, LLDB, LLD
# * CLang/CLang++
# * CLang Tidy and CLang Tools
# * Doxygen
#
echo "---"
echo "Installing LLVM/CLang development environment."
echo "---"

echo "1. Installing CMake..."
dnf install -y cmake cmake-doc extra-cmake-modules

echo "2. Installing LLVM environment..."
dnf install -y llvm llvm-doc llvm-devel

echo "3. Installing LLDB and LLD..."
dnf install -y lldb lld

echo "4. Installing CLang..."
dnf install -y clang clang-libs clang-tools-extra

echo "5. Testing compiling the basic 'Hello World' application..."
rm hello_world
clang++ hello_world.cpp -o hello_world

echo "Please, check if the 'Hello World!' message appears bellow the line."
echo "--------------------------------------------------------------------"
./hello_world

echo "--------------------------------------------------------------------"
echo "6. Installing doxygen..."
dnf install -y doxygen

echo "--------------------------------------------------------------------"
echo "Installation Summary"
echo "--------------------------------------------------------------------"
cmake --version
echo " "
lldb --version
echo " "
ld.lld --version
echo " "
clang++ --version
echo " "
echo "Doxygen version:"
doxygen --version
echo "--------------------------------------------------------------------"
