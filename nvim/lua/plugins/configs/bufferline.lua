require("bufferline").setup({
	options = {
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "center",
				separator = true,
			},
		},
		diagnostics = "nvim_lsp",
	},
})

local map = vim.keymap.set

map("n", "<A-c>", ":bp|bd #<CR>")
map("n", "<A-p>", ":BufferLineTogglePin<CR>")
map("n", "<A-,>", ":BufferLineCyclePrev<CR>")
map("n", "<A-.>", ":BufferLineCycleNext<CR>")
map("n", "<A-<>", ":BufferLineMovePrev<CR>")
map("n", "<A->>", ":BufferLineMoveNext<CR>")
