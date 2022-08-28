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

-- Symbols-outline
map.set('n', '<leader>ol', ':SymbolsOutline<CR>') -- show symbols-outline panel

-- Telescope
map.set('n', '<leader>ff', ':Telescope find_files hidden=true no_ignore=true<CR>')
map.set('n', '<leader>fg', ':Telescope live_grep<CR>')
map.set('n', '<leader>fb', ':Telescope buffers<CR>')
map.set('n', '<leader>fh', ':Telescope help_tags<CR>')

-- BarBar
local api_map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
api_map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
api_map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
api_map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
api_map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
api_map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
api_map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
api_map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
api_map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
api_map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
api_map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
api_map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
api_map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
api_map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
api_map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
api_map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
api_map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
api_map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
api_map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
api_map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
api_map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
api_map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used
