local set = vim.opt

set.autoindent = true
set.cursorline = true
set.background = 'dark'
set.clipboard = 'unnamedplus' -- link clipbaord to '+' register (need xsel)
set.hidden = true
set.completeopt = 'menu,menuone,noselect'
set.number = true
set.relativenumber = true
set.splitbelow = true
set.splitright = true
set.title = true
set.wildmenu = true
set.expandtab = true
set.shiftwidth = 2
set.tabstop = 2
set.softtabstop = 2
set.mouse = 'a'
set.ignorecase = true
set.smartcase = true
set.hlsearch = true
set.incsearch = true
set.cc = { 80, 120 }
set.swapfile = false
set.backspace = 'indent,start,eol'
set.wrap = false

vim.cmd [[ set signcolumn=yes:2 ]]
vim.cmd [[ set list listchars=tab:\ \ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨ ]]
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]] -- auto format

vim.cmd [[
	syntax on
  filetype plugin on
]]

