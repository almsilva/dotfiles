#!/bin/sh

sudo dnf install -y vim ctags
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
