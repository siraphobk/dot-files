vim.cmd([[
if has('termguicolors')
  set termguicolors
endif
]])

require("themes.sonokai")
require("themes.lualine")
-- require("themes.gruvbox-material")

-- Uncomment to select default theme
-- vim.cmd([[ colorscheme catppuccin ]])
vim.cmd([[ colorscheme sonokai ]])
-- vim.cmd([[ colorscheme gruvbox-material ]])
