syntax on

filetype plugin indent on

colorscheme desert

set background=dark
set termguicolors

set nocompatible

set autoread
set autowriteall

if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
else
  set clipboard=unnamedplus "Linux
endif
set noswapfile

set number

set backspace=indent,eol,start
set laststatus=2
set display=lastline

set showmode
set showcmd

set ttyfast
set lazyredraw
set mouse=a

set cursorline

set wildmenu
set wildmode=list:longest,full

set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent

set gdefault
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch

let mapleader = ","

nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap ; :

au FocusLost * :wa
