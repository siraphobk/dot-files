return {
  -- Themes --------------------------------------------------------------------
  -- For theme setup, please navigate to '/lua/themes'

  { "sainnhe/gruvbox-material" },
  { "folke/tokyonight.nvim" },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = {
          light = "latte",
          dark = "mocha",
        },
        show_end_of_buffer = true, -- show the '~' characters after the end of buffers
        term_colors = false,
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
          loops = {},
          functions = { "bold" },
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        color_overrides = {
          mocha = {
            base = "#111111",
            blue = "#b3e8ff"
          },
        },
        custom_highlights = {},
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          telescope = true,
          notify = false,
          mini = false,
          barbar = true,
          mason = true,
          lsp_trouble = true,
          dap = true,
          treesitter_context = true,
          which_key = true,
        },
      })

      vim.cmd([[ colorscheme catppuccin-mocha ]])
    end
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require('kanagawa').setup({
        compile = false,  -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = { bold = true },
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false,   -- do not set background color
        dimInactive = true,    -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = {
          palette = {
            -- dragonBlack3 = "#0b0b0b",
          },
          theme = {
            wave = {},
            lotus = {},
            dragon = {},
            all = {
              ui = {
                bg_gutter = "none"
              },
            },
          },
        },
        theme = "wave",
        background = {
          dark = "dragon",
          light = "lotus"
        },
      })

      -- local colors = require("kanagawa.colors").setup()
      -- local palette_colors = colors.palette
      -- vim.api.nvim_create_autocmd({ "ColorScheme" }, {
      --   pattern = "*",
      --   callback = function()
      --     vim.cmd("hi NvimTreeNormal guibg=" .. "#0D0D0D")
      --   end,
      -- })
    end
  },
  {
    "tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require("tokyonight").setup({
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = { bold = true },
          variables = {},
          -- Background styles. Can be "dark", "transparent" or "normal"
          sidebars = "dark",                                            -- style for sidebars, see below
          floats = "dark",                                              -- style for floating windows
        },
        sidebars = { "qf", "help", "terminal", "aerial", "nvim-tree" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
        day_brightness = 0.3,                                           -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
        hide_inactive_statusline = false,                               -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
        dim_inactive = false,                                           -- dims inactive windows
        lualine_bold = false,                                           -- When `true`, section headers in the lualine theme will be bold
      })
    end
  },

  -- Other ---------------------------------------------------------------------
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
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
