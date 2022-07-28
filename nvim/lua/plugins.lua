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
Plug('vim-airline/vim-airline')
Plug('vim-airline/vim-airline-themes')
Plug('folke/tokyonight.nvim', { branch='main' })
Plug('ellisonleao/gruvbox.nvim')
Plug('mfussenegger/nvim-dap')
Plug('rcarriga/nvim-dap-ui')
Plug('leoluz/nvim-dap-go')
Plug('theHamsta/nvim-dap-virtual-text')
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')
Plug('jose-elias-alvarez/null-ls.nvim')

vim.call('plug#end')

-- Load Plugin Configurations
require('plugin/treesitter')
require('plugin/nvimtree')
require('plugin/nvimcmp')
require('plugin/lspconfig')
require('plugin/gonvim')
require('plugin/gitsigns')
require('plugin/symbolsoutline')
require('plugin/dap')
require('plugin/dapgo')
require('plugin/dapui')
require('plugin/mason')
require('plugin/masonlspconfig')
require('plugin/nullls')
require('plugin/telescope')
