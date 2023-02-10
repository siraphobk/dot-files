return {
  {
    "iamcco/markdown-preview.nvim",
    dependencies = {
      {
        "mzlogin/vim-markdown-toc",
      },
    },
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = { "markdown" },
  }
}
