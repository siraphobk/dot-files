return {
  -- NOTE: Buggy
  -- {
  --   'romgrk/barbar.nvim',
  --   dependencies = 'nvim-tree/nvim-web-devicons',
  --   config = function()
  --     require("plugins.navigation.barbar")
  --   end,
  -- },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("plugins.navigation.bufferline")
    end
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { { "nvim-lua/plenary.nvim" } },
    config = function()
      require("plugins.navigation.telescope")
    end,
  },
}
