local autotags_file_types = {
  "html",
  "javascript",
  "typescript",
  "javascriptreact",
  "typescriptreact",
  "svelte",
  "vue",
  "tsx",
  "jsx",
  "rescript",
  "xml",
  "php",
  "markdown",
  "glimmer",
  "handlebars",
  "hbs",
}

return {
  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({})
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    ft = autotags_file_types,
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup({ autotag = { enable = true, } })
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },
  {
    "ThePrimeagen/harpoon",
    event = "BufReadPre",
    config = function()
      require("plugins.text-editing.harpoon")
    end,
  },

  -- Completion engine
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "onsails/lspkind.nvim" },
    },
    config = function()
      require("plugins.text-editing.cmp")
    end,
  },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },

  -- Snippet engine (Required for completion engine)
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "1.*",
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    config = function()
      require("plugins.text-editing.luasnip")
    end,
  },
  { "saadparwaiz1/cmp_luasnip" },
  {
    'stevearc/aerial.nvim',
    config = function()
      require('aerial').setup({
        layout = {
          max_width = { 100, 0.3 },
        },
        show_guides = true,
      })

      require('telescope').load_extension('aerial')

      vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle!<CR>')
    end
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("plugins.text-editing.comment")
    end,
    event = { "InsertEnter", "ModeChanged" },
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    module = "persistence",
    config = function()
      require("plugins.text-editing.persistence")
    end,
  },
  {
    "windwp/nvim-spectre",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("plugins.text-editing.spectre")
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("plugins.text-editing.trouble")
    end,
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    config = function()
      require("plugins.text-editing.ufo")
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup {
        show_current_context = true,
        show_current_context_start = true,
        show_end_of_line = true,
      }
    end
  },
  {
    "phaazon/hop.nvim",
    branch = "v2",
    config = function()
      require("plugins.text-editing.hop")
    end
  },
}
