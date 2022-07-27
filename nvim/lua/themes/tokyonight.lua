-- Example config in Lua
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer", "nvim-tree" }

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }
vim.g.tokyonight_transparent = false
vim.g.tokyonight_transparent_sidebar = false
vim.g.tokyonight_dark_sidebar = true

-- Load the colorscheme
vim.cmd[[colorscheme tokyonight]]
