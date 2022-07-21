" This file contains remaps.

nnoremap <SPACE> <Nop>
let mapleader=" "

" remap j to gj and k to gk
nnoremap j gj
nnoremap k gk

" windows resizing
" increase resizing by 10 times
nnoremap <C-w>> 10<C-w>>
nnoremap <C-w>< 10<C-w><
nnoremap <C-w>+ 10<C-w>+
nnoremap <C-w>- 10<C-w>-

" tab manipulation and navigation
nnoremap <C-t> :tabnew<CR>
nnoremap <C-x> :tabclose<CR>
nnoremap <C-p> :tabprevious<CR>
nnoremap <C-n> :tabnext<CR>

" auto pairing parens
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" move between panes to left/bottom/top/right
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" split panes
nnoremap <leader>\| :vsplit<CR>
nnoremap <leader>- :split<CR>
