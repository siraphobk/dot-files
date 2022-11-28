vim.cmd([[
if has('termguicolors')
  set termguicolors
endif
]])

require("themes.sonokai")
require("themes.gruvbox-material")
require("themes.lualine")

-- Uncomment to select default theme
vim.cmd([[ colorscheme catppuccin ]])
-- vim.cmd([[ colorscheme sonokai ]])
-- vim.cmd([[ colorscheme gruvbox-material ]])
