require("settings") -- default native settings for Neovim
require("plugins")  -- plugin manager
require("keymaps")  -- native keymaps

-- load plugins
require("plugin_opts/nvim-tree")
require("plugin_opts/telescope")
require("plugin_opts/treesitter")
require("plugin_opts/mason")
require("plugin_opts/lspconfig")
require("plugin_opts/nvim-cmp")
require("plugin_opts/toggleterm")
require("plugin_opts.go-nvim")

-- load themes
require("themes/sonokai")
require("themes/lualine")
