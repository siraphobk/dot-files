return {
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("plugins.navigation.bufferline")
    end
  },
  {
    'famiu/bufdelete.nvim',
    config = function()
      local map = vim.api.nvim_set_keymap
      local opts = { noremap = true, silent = true }
      map('n', '<A-c>', ":lua require('bufdelete').bufdelete(0, false)<CR>", opts)
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
