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

local wk = require("which-key")

wk.register({
  -- Telescope
  f = {
    name = 'Telescope',
    f = { ':Telescope find_files hidden=true no_ignore=true<CR>', "Find Files" },
    g = { ':Telescope live_grep<CR>', "Live Grep" },
    b = { ':Telescope buffers<CR>', "Buffers" },
    h = { ':Telescope help_tags<CR>', "Help Tags" },
  },

  -- Nvim-Tree
  t = {
    name = 'Nvim-Tree',
    t = { function() nt_api.tree.toggle() end, "Toggle Tree" },
    f = { function() nt_api.tree.find_file(vim.fn.expand('%')) end, "Find the current file" },
    r = { function() nt_api.tree.reload() end, "Reload Tree" },
    F = { function() nt_api.tree.focus() end, "Focus Tree" },
  },

  -- Symbols-Outline
  o = {
    name = 'Symbols Outline',
    l = { ':SymbolsOutline<CR>', "Toggle Symbols Outline" },
  }
}, { prefix = '<leader>' })
