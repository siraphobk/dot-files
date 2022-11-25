vim.cmd([[

if has('termguicolors')
  set termguicolors
endif

]])

vim.g.sonokai_style = "shusia"
vim.g.sonokai_better_performance = 1
vim.g.sonokai_enable_italic = 1
vim.g.sonokai_diagnostic_virtual_text = "colored"

-- vim.cmd([[
--   let g:sonokai_colors_override = {
--     \ 'bg0': ['#141414', '233']
--   \ }
-- ]])

vim.cmd([[ colorscheme sonokai ]])
