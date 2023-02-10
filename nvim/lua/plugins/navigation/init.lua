return {
  {
    "akinsho/bufferline.nvim",
    version = "v3.*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("plugins.navigation.bufferline").configure()
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { { "nvim-lua/plenary.nvim" } },
    build = "sudo apt install ripgrep",
    config = function()
      require("plugins.navigation.telescope").configure()
    end,
  },
}
