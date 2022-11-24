return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
	})

	use({
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		requires = { { "nvim-lua/plenary.nvim" } },
		run = "sudo apt install ripgrep",
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		requires = {
			{ "nvim-treesitter/nvim-treesitter-context" },
		},
	})

	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup()
		end,
	})

	use("williamboman/mason.nvim")

	use("neovim/nvim-lspconfig") -- Configurations for Nvim LSP

	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/vim-vsnip")

	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	})

	use({ "akinsho/toggleterm.nvim", tag = "*" })

	use("ray-x/go.nvim")
	use("ray-x/guihua.lua") -- recommended if need floating window support

	-- THEMES
	use("sainnhe/sonokai")
	use("sainnhe/gruvbox-material")

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	use("simrat39/symbols-outline.nvim")

	use({
		"mfussenegger/nvim-dap",
		run = "go install github.com/go-delve/delve/cmd/dlv@latest",
		requires = {
			{ "leoluz/nvim-dap-go" },
			{ "rcarriga/nvim-dap-ui" },
		},
	})

	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	use("lukas-reineke/indent-blankline.nvim")

	use({
		"romgrk/barbar.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
	})

	use("rust-lang/rust.vim")

	-- Dashboard
	use({
		"goolord/alpha-nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	})

	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	use({
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup({
				log_level = "error",
				auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			})
		end,
	})

	use({
		"windwp/nvim-spectre",
		requires = {
			"nvim-lua/plenary.nvim",
		},

		config = function()
			local spectre = require("spectre")
			spectre.setup()

			vim.keymap.set("n", "<leader>So", function()
				spectre.open()
			end)
			vim.keymap.set("n", "<leader>Sw", function()
				spectre.open_visual({ select_word = true })
			end)
			vim.keymap.set("n", "<leader>Sf", function()
				spectre.open_file_search()
			end)
		end,
	})

	use({ "jose-elias-alvarez/null-ls.nvim" })

	use({
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup()
		end,
	})
end)
