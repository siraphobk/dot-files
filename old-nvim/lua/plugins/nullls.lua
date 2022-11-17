local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.completion.spell,
		null_ls.builtins.formatting.prettier.with({
			filetypes = { "html", "css", "yaml", "markdown", "json", "graphql" },
		}),
	},
})

-- Command 'FormatCurrFile' formats the current file
vim.cmd("command FormatCurrFile lua vim.lsp.buf.formatting()")
