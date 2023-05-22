require("catppuccin").setup({
  flavour = "mocha", -- latte, frappe, macchiato, mocha
  background = {
    light = "latte",
    dark = "mocha",
  },
  transparent_background = false,
  show_end_of_buffer = true, -- show the '~' characters after the end of buffers
  term_colors = false,
  dim_inactive = {
    enabled = true,
    shade = "dark",
    percentage = 0.50,
  },
  no_italic = false, -- Force no italic
  no_bold = false,   -- Force no bold
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
