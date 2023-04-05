return {
  {
    -- Sign column for Git
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
    event = "BufEnter",
  },
  {
    -- Git integration
    "tpope/vim-fugitive",
  },
  {
    -- GitHub integration plugin
    'pwntester/octo.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require "octo".setup()
    end
  }
}
