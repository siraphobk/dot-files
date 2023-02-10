return {
  {
    "iamcco/markdown-preview.nvim",
    dependencies = {
      {
        "mzlogin/vim-markdown-toc",
      },
    },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = { "markdown" },
  }
}
