vim.cmd [[
  if has('termguicolors')
    set termguicolors
  endif
]]

-- Available themes: catppuccin, kanagawa, tokyonight
local theme = "catppuccin"

if theme == "catppuccin" then
  -- vim.cmd([[ colorscheme catppuccin-mocha ]])
elseif theme == "kanagawa" then
  vim.cmd([[ colorscheme kanagawa-dragon ]])
elseif theme == "tokyonight" then
  vim.cmd([[ colorscheme tokyonight-moon ]])
end

-- vim.cmd([[
--   " set highlight cursorline to grey
--   highlight CursorLine term=none cterm=none ctermfg=none ctermbg=none gui=none guifg=none guibg=#353535
-- ]])
