local map = vim.keymap
local nt_api = require("nvim-tree.api")

vim.g.mapleader = ' '

-- Navigation
map.set('n', '<C-h>', '<C-w>h')
map.set('n', '<C-l>', '<C-w>l')
map.set('n', '<C-j>', '<C-w>j')
map.set('n', '<C-k>', '<C-w>k')
map.set('t', '<C-h>', '<C-\\><C-N><C-w>h')
map.set('t', '<C-j>', '<C-\\><C-N><C-w>j')
map.set('t', '<C-k>', '<C-\\><C-N><C-w>k')
map.set('t', '<C-l>', '<C-\\><C-N><C-w>l')
map.set('i', '<C-h>', '<C-\\><C-N><C-w>h')
map.set('i', '<C-j>', '<C-\\><C-N><C-w>j')
map.set('i', '<C-k>', '<C-\\><C-N><C-w>k')
map.set('i', '<C-l>', '<C-\\><C-N><C-w>l')

-- Window management
map.set('n', '<C-w>>', '10<C-w>>') -- adjust width
map.set('n', '<C-w><', '10<C-w><')
map.set('n', '<C-w>+', '10<C-w>+') -- adjust height
map.set('n', '<C-w>-', '10<C-w>-')

-- Nvim-Tree
map.set('n', '<leader>tt', function() nt_api.tree.toggle() end)
map.set('n', '<leader>tF', function() nt_api.tree.focus() end)
map.set('n', '<leader>tf', function() nt_api.tree.find_file(vim.fn.expand('%')) end)
map.set('n', '<leader>tr', function() nt_api.tree.reload() end)

-- Telescope
map.set('n', '<leader>ff', ':Telescope find_files hidden=true no_ignore=true<CR>')
map.set('n', '<leader>fg', ':Telescope live_grep<CR>')
map.set('n', '<leader>fb', ':Telescope buffers<CR>')
map.set('n', '<leader>fh', ':Telescope help_tags<CR>')

-- BufferLine

-- Cycle next
map.set('n', '<A-.>', ':BufferLineCycleNext<CR>')
map.set('n', '<A-,>', ':BufferLineCyclePrev<CR>')
map.set('n', '<A->>', ':BufferLineMoveNext<CR>')
map.set('n', '<A-<>', ':BufferLineMovePrev<CR>')
map.set('n', '<A-<>', ':BufferLineMovePrev<CR>')
-- Close the current tab
map.set('n', '<A-c>', function() 
  -- Whenever a buffer is closed, automatically opens the tree
  nt_api.tree.close()
  vim.api.nvim_buf_delete(0, {})
  nt_api.tree.toggle(true, true)
end)
