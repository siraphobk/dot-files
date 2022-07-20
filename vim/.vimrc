" -- VIM-PLUG
call plug#begin()

Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jparise/vim-graphql'
Plug 'majutsushi/tagbar'
Plug 'pangloss/vim-javascript'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'yggdroot/indentline'

call plug#end()

source ./vimscripts/remaps.vim
source ./vimscripts/native.vim
source ./vimscripts/pluginconf.vim
