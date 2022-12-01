-- Auto-install Packer
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- Auto-reload Packer when this file is edited.
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

vim.cmd([[packadd packer.nvim]])

-- Fts
local go_file_types = { "go", "gomod", "gosum", "gotmpl", "gohtmltmpl", "gotexttmpl" }
local autotags_file_types = {
	"html",
	"javascript",
	"typescript",
	"javascriptreact",
	"typescriptreact",
	"svelte",
	"vue",
	"tsx",
	"jsx",
	"rescript",
	"xml",
	"php",
	"markdown",
	"glimmer",
	"handlebars",
	"hbs",
}

-- Start Packer
return require("packer").startup(function(use)
	use({ "wbthomason/packer.nvim", opt = true })

	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup()
		end,
	})

	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("plugins.configs.nvim-tree")
		end,
	})

	use({
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		requires = { { "nvim-lua/plenary.nvim" } },
		run = "sudo apt install ripgrep",
		config = function()
			require("plugins.configs.telescope")
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		requires = {
			{ "nvim-treesitter/nvim-treesitter-context" },
		},
		config = function()
			require("plugins.configs.treesitter")
		end,
	})

	use({
		"windwp/nvim-ts-autotag",
		ft = autotags_file_types,
		event = "InsertEnter",
		config = function()
			require("nvim-ts-autotag").setup({
				autotag = {
					enable = true,
				},
			})
		end,
	})

	use({
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	use({
		"romgrk/barbar.nvim",
		requires = { { "kyazdani42/nvim-web-devicons" } },
		config = function()
			require("plugins.configs.barbar")
		end,
	})

	use({
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	})

	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lspconfig")
		end,
	})

	-- Completion engine
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-cmdline" })
	use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("plugins.configs.nvim-cmp")
		end,
	})
	-- Snippet engine (Required for completion engine)
	use({ "L3MON4D3/LuaSnip" })
	use({ "saadparwaiz1/cmp_luasnip" })

	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
		event = "BufEnter",
	})

	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("plugins.configs.toggleterm")
		end,
	})

	use({
		"ray-x/go.nvim",
		config = function()
			require("plugins.configs.go-nvim")
		end,
		ft = go_file_types,
	})
	use("ray-x/guihua.lua") -- floating windows

	-- THEMES
	use("sainnhe/sonokai")
	use({ "sainnhe/gruvbox-material", opt = true })
	use({
		"catppuccin/nvim",
		as = "catppuccin",
		opt = true,
	})

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	use({
		"simrat39/symbols-outline.nvim",
		config = function()
			require("symbols-outline").setup()
			vim.keymap.set("n", "<leader>a", ":SymbolsOutline<CR>")
		end,
	})

	use({
		"mfussenegger/nvim-dap",
		run = "go install github.com/go-delve/delve/cmd/dlv@latest",
		config = function()
			require("plugins.configs.dap")
		end,
		requires = {
			{
				"leoluz/nvim-dap-go",
				ft = go_file_types,
				after = "nvim-dap",
				config = function()
					require("dap-go").setup()
				end,
			},
			{
				"rcarriga/nvim-dap-ui",
				after = "nvim-dap",
				config = function()
					require("plugins.configs.dapui")
				end,
			},
			{
				"theHamsta/nvim-dap-virtual-text",
				after = "nvim-dap",
				config = function()
					require("nvim-dap-virtual-text").setup({})
				end,
			},
		},
	})

	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
		ft = { "markdown" },
	})

	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("plugins.configs.indent-blankline")
		end,
	})

	use({ "rust-lang/rust.vim", ft = { "rust" } })

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
		event = { "InsertEnter", "ModeChanged" },
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

	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("plugins.configs.null-ls")
		end,
	})

	use({
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup()
		end,
	})

	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({})

			vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
			vim.keymap.set(
				"n",
				"<leader>xw",
				"<cmd>TroubleToggle workspace_diagnostics<cr>",
				{ silent = true, noremap = true }
			)
			vim.keymap.set(
				"n",
				"<leader>xd",
				"<cmd>TroubleToggle document_diagnostics<cr>",
				{ silent = true, noremap = true }
			)

			vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { silent = true, noremap = true })
			vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { silent = true, noremap = true })
			vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { silent = true, noremap = true })
		end,
	})

	-- Performance
	use({
		"dstein64/vim-startuptime",
		cmd = { "StartupTime" },
	})

	use({
		"lewis6991/impatient.nvim",
		config = function()
			require("impatient")
		end,
	})

	-- Shenanigans
	use({ "eandrju/cellular-automaton.nvim", cmd = { "CellularAutomaton" }, opt = true })
	use({
		"tamton-aquib/duck.nvim",
		opt = true,
		config = function()
			vim.api.nvim_create_user_command("DuckHatch", function()
				require("duck").hatch("🐞", 20)
			end, {})
			vim.api.nvim_create_user_command("DuckCook", function()
				require("duck").cook()
			end, {})
		end,
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
