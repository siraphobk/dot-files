local p_lsp = require("plugins.configs.lspconfig") -- internal plugin import

require("go").setup({
	luasnip = true,
	lsp_cfg = true, -- use default lsp config
	lsp_keymaps = p_lsp.set_keymaps,
})
