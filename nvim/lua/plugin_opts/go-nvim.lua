local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

require("go").setup({
	lsp_cfg = {
		capabilities = lsp_capabilities,
	},
	luasnip = true,
})

-- auto-format and import
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		require("go.format").goimport()
	end,
	group = format_sync_grp,
})
