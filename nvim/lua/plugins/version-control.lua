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
    'akinsho/git-conflict.nvim',
    version = "*",
    config = function()
      require 'git-conflict'.setup {
        {
          default_mappings = false,
          default_commands = true,
          disable_diagnostics = false,
          highlights = {
            incoming = 'DiffText',
            current = 'DiffAdd',
          }
        }
      }

      local wk = require('which-key')
      wk.register({
        ['G'] = {
          name = '+git',
          r = { '<cmd>GitConflictRefresh<cr>', 'Refresh the conflict markers' },
          l = { '<cmd>GitConflictListQf<cr>', 'List all conflicts' },
          o = { '<cmd>GitConflictChooseOurs<cr>', 'Select the current changes' },
          t = { '<cmd>GitConflictChooseTheirs<cr>', 'Select the incoming changes' },
          b = { '<cmd>GitConflictChooseBoth<cr>', 'Select both changes' },
          n = { '<cmd>GitConflictNextConflict<cr>', 'Move to the next conflict' },
          p = { '<cmd>GitConflictPrevConflict<cr>', 'Move to the previous conflict' },
          ['0'] = { '<cmd>GitConflictChooseNone<cr>', 'Select none of the changes' },
        }
      }, { prefix = '<leader>' })
    end
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
