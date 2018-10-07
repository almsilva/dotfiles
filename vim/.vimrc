" Configure to use soft tabs.
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Bundle 'vim-ruby/vim-ruby'

Plugin 'majutsushi/tagbar'
Plugin 'Rip-Rip/clang_complete'
Plugin 'tpope/vim-fugitive'
Plugin 'octol/vim-cpp-enhanced-highlight'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'flazz/vim-colorschemes'
Plugin 'morhetz/gruvbox'

call vundle#end()
filetype plugin indent on
set number

" Search improvement.
set incsearch
set hlsearch
set ignorecase
set smartcase

" Show hidden characters
set list
set listchars=eol:¬,trail:⎵,tab:¦¦,space:⸱

" Line limit highlight
set colorcolumn=110
highlight ColorColumn ctermbg=darkgray
set nowrap

" Themes, color scheme, fonts
color gruvbox 
set background=dark
syntax on
