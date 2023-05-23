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
