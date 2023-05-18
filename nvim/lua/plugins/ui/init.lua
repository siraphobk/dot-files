return {
  -- Themes --------------------------------------------------------------------
  -- For theme setup, please navigate to '/lua/themes'

  { "sainnhe/gruvbox-material" },
  { "folke/tokyonight.nvim" },
  {
    "catppuccin/nvim",
    name = "catppuccin",
  },
  { "rebelot/kanagawa.nvim" },

  -- Other ---------------------------------------------------------------------
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
    config = function()
      require("plugins.ui.lualine")
    end,
  },
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("plugins.ui.dashboard")
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup({})
    end,
    -- Examples
    -- TODO: What else?
    -- HACK: Weird code
    -- FIX: Needs fixing
    -- PERF: Fully optimised
    -- WARNING: Beware, coders...
    -- NOTE: Note to self
  },
}
