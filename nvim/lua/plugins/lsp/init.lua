local go_file_types = { "go", "gomod", "gosum", "gotmpl", "gohtmltmpl", "gotexttmpl" }

return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded"
        }
      })
      require("mason-lspconfig").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.lsp.lspconfig")
    end,
  },
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("plugins.lsp.go")
    end,
    ft = go_file_types,
  },

  -- none-ls and formatter.nvim are contested!
  {
    "nvimtools/none-ls.nvim",
    config = function()
      require("plugins.lsp.null-ls")
    end,
  },
  -- {
  --   "mhartington/formatter.nvim",
  --   config = function()
  --     require("plugins.lsp.formatter")
  --   end,
  -- },
}
