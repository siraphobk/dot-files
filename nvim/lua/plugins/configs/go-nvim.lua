local p_lsp = require("plugins.configs.lspconfig") -- internal plugin import

-- local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("go").setup({
  luasnip = true,
  lsp_keymaps = p_lsp.set_keymaps,
  -- lsp_cfg = {
  -- 	capabilities = capabilities,
  -- 	on_attach = p_lsp.on_attach,
  -- },
  dap_debug = false
})
