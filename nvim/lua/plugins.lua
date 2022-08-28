-- Useful vim-plug setup in Neovim (https://dev.to/vonheikemen/neovim-using-vim-plug-in-lua-3oom)

local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { tag='0.1.0' })
Plug('nvim-treesitter/nvim-treesitter', { ['do']= vim.fn['TSUpdate'] })
Plug('nvim-treesitter/nvim-treesitter-context')
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
Plug('mfussenegger/nvim-dap')
Plug('rcarriga/nvim-dap-ui')
Plug('leoluz/nvim-dap-go')
Plug('theHamsta/nvim-dap-virtual-text')
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')
Plug('mfussenegger/nvim-lint')
Plug('jose-elias-alvarez/null-ls.nvim')
Plug('tpope/vim-fugitive')
Plug('karb94/neoscroll.nvim')
Plug('lukas-reineke/indent-blankline.nvim')
Plug('navarasu/onedark.nvim')
Plug('akinsho/toggleterm.nvim', {tag='v2.*'})
Plug('iamcco/markdown-preview.nvim', { ['do']='cd app && yarn install' })
Plug('romgrk/barbar.nvim')

vim.call('plug#end')

-- Load Plugin Configurations
require('plugins/treesitter')
require('plugins/treesitter_context')
require('plugins/nvim_tree')
require('plugins/nvim_cmp')
require('plugins/lspconfig')
require('plugins/gonvim')
require('plugins/gitsigns')
require('plugins/symbolsoutline')
require('plugins/dap')
require('plugins/dapgo')
require('plugins/dapui')
require('plugins/mason')
require('plugins/masonlspconfig')
require('plugins/nullls')
require('plugins/telescope')
require('plugins/neoscroll')
require('plugins/indent_blankline')
require('plugins/toggleterm')
require('plugins/lint')
require('plugins/barbar')

