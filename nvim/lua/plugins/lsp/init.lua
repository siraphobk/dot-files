return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.lsp.lspconfig").configure()
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("plugins.lsp.null-ls").configure()
    end,
  },
}
