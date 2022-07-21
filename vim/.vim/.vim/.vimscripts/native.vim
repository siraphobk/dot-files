" This file contains native Vim configurations

syntax on                   " syntax highlighting
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80,120               " set an 80 column border for good coding style
hi ColorColumn ctermbg=lightgrey guibg=lightblue
filetype plugin indent on   "allow auto-indenting depending on file type
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set encoding=UTF-8
set foldmethod=syntax       " set folding based on syntax
set foldlevelstart=30       " set foldlevelstart to a random large number to prevent folding everything when start editing
set nofoldenable            " makes sure that when opening, files are not folded
set nowrap                  " line keeps going on
set noswapfile              " disable swap file creation
set relativenumber
set backspace=indent,eol,start
" set tab display to have indent line
set list lcs=tab:\|\ 

