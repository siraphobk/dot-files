require("go").setup({
  luasnip = true,
  lsp_keymaps = require("plugins.lsp.common").set_keymaps,
  dap_debug = false
})
