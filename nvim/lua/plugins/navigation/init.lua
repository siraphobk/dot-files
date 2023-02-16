return {
  {
    'romgrk/barbar.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("plugins.navigation.barbar")
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { { "nvim-lua/plenary.nvim" } },
    build = "sudo apt install ripgrep",
    config = function()
      require("plugins.navigation.telescope")
    end,
  },
}
