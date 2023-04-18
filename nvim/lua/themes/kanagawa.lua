require('kanagawa').setup({
  compile = false,  -- enable compiling the colorscheme
  undercurl = true, -- enable undercurls
  commentStyle = { italic = true },
  functionStyle = {},
  keywordStyle = { italic = true },
  statementStyle = { bold = true },
  typeStyle = {},
  transparent = false,   -- do not set background color
  dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
  terminalColors = true, -- define vim.g.terminal_color_{0,17}
  colors = {
    palette = {
      dragonBlack3 = "#0b0b0b",
    },
    theme = {
      wave = {},
      lotus = {},
      dragon = {
      },
      all = {
        ui = {
          bg_gutter = "none"
        },
      },
    },
  },
  overrides = function(colors) -- add/modify highlights
    return {}
  end,
  theme = "wave", -- Load "wave" theme when 'background' option is not set
  background = {
    -- map the value of 'background' option to a theme
    dark = "dragon", -- try "dragon" !
    light = "lotus"
  },
})

vim.cmd([[ colorscheme kanagawa ]])

local colors = require("kanagawa.colors").setup()
local palette_colors = colors.palette
vim.api.nvim_create_autocmd({ "ColorScheme" }, {
  pattern = "*",
  callback = function()
    vim.cmd("hi NvimTreeNormal guibg=" .. "#111111")
  end,
})

vim.cmd([[ colorscheme kanagawa ]]) -- triggering the autocmd
