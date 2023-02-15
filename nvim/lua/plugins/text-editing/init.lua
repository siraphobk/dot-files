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

  -- Completion engine
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "onsails/lspkind.nvim" },
    },
    config = function()
      require("plugins.text-editing.cmp").configure()
    end,
  },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },

  -- Snippet engine (Required for completion engine)
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("plugins.text-editing.luasnip").configure()
    end,
  },
  { "saadparwaiz1/cmp_luasnip" },
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require("symbols-outline").setup()
      vim.keymap.set("n", "<leader>a", ":SymbolsOutline<CR>")
    end,
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("plugins.text-editing.comment").configure()
    end,
    event = { "InsertEnter", "ModeChanged" },
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    module = "persistence",
    config = function()
      require("plugins.text-editing.persistence").configure()
    end,
  },
  {
    "windwp/nvim-spectre",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("plugins.text-editing.spectre").configure()
    end,
  },
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup()
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("plugins.text-editing.trouble").configure()
    end,
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    config = function()
      require("plugins.text-editing.ufo").configure()
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
}
