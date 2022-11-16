-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require("nvim-tree").setup({
  view = {
    adaptive_size = true,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})


local nt_api = require("nvim-tree.api")
local set = vim.keymap.set

set('n', '<leader>tt', function() nt_api.tree.toggle() end)
set('n', '<leader>tf', function() nt_api.tree.find_file(vim.api.nvim_buf_get_name(0)) end)
set('n', '<leader>tF', function() nt_api.tree.focus() end)

