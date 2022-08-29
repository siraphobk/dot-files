local telescope = require("telescope")

telescope.load_extension('aerial')
telescope.setup({
  extensions = {
    aerial = {
      -- Display symbols as <root>.<parent>.<symbol>
      show_nesting = true
    }
  }
})
