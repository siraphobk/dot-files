vim.cmd [[
  if has('termguicolors')
    set termguicolors
  endif
]]

-- Available themes: catppuccin, kanagawa
local theme = "kanagawa"

if theme == "catppuccin" then
  require("themes.catppuccin")
elseif theme == "kanagawa" then
  require("themes.kanagawa")
end

vim.cmd([[
  " set highlight cursorline to grey
  highlight CursorLine term=none cterm=none ctermfg=none ctermbg=none gui=none guifg=none guibg=#353535
]])
