local go_file_types = { "go", "gomod", "gosum", "gotmpl", "gohtmltmpl", "gotexttmpl" }

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded"
        }
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.lsp.lspconfig")
    end,
  },
  {
    "mhartington/formatter.nvim",
    config = function()
      require("plugins.lsp.formatter")
    end,
  },
  -- {
  --   "jose-elias-alvarez/null-ls.nvim",
  --   config = function()
  --     require("plugins.lsp.null-ls")
  --   end,
  -- },
  {
    "ray-x/go.nvim",
    config = function()
      require("plugins.lsp.go")
    end,
    ft = go_file_types,
  },
  { "ray-x/guihua.lua" }
}
