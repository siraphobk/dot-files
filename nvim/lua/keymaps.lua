local map = vim.keymap
local nt_api = require("nvim-tree.api")

vim.g.mapleader = ' '

-- Navigation

-- Telescope
map.set('n', '<leader>ff', ':Telescope find_files<CR>')
map.set('n', '<leader>fg', ':Telescope live_grep<CR>')
map.set('n', '<leader>fb', ':Telescope buffers<CR>')
map.set('n', '<leader>fh', ':Telescope help_tags<CR>')

-- nvim-tree
map.set('n', '<leader>tt', function() require("nvim-tree.api").tree.toggle() end)
map.set('n', '<leader>tf', function() nt_api.tree.focus() end)
map.set('n', '<leader>tr', function() nt_api.tree.reload() end)

vim.cmd [[
  inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
]]
