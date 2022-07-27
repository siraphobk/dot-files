-- Useful vim-plug setup in Neovim (https://dev.to/vonheikemen/neovim-using-vim-plug-in-lua-3oom)

local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { tag='0.1.0' })
Plug('nvim-treesitter/nvim-treesitter', { ['do']= vim.fn['TSUpdate'] })
Plug('kyazdani42/nvim-web-devicons') -- optional, for file icons (needs patched fonts, source: https://www.nerdfonts.com/)
Plug('kyazdani42/nvim-tree.lua')
Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/nvim-cmp')
Plug('ray-x/go.nvim')
Plug('ray-x/guihua.lua')
Plug('lewis6991/gitsigns.nvim')
Plug('simrat39/symbols-outline.nvim')

vim.call('plug#end')

-- Load Plugin Configurations
require('plugin/treesitter')
require('plugin/nvimtree')
require('plugin/lspconfig')
require('plugin/nvimcmp')
require('plugin/gonvim')
require('plugin/gitsigns')
require('plugin/symbolsoutline')
