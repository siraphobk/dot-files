require("telescope").setup()

local builtin = require("telescope.builtin")
local wk = require("which-key")

wk.register({
	f = {
		name = "Telescope",
		f = {
			function()
				builtin.find_files()
			end,
			"Find Files",
		},
		g = {
			function()
				builtin.live_grep()
			end,
			"Live Grep",
		},
		b = {
			function()
				builtin.buffers()
			end,
			"Buffers",
		},
		h = {
			function()
				builtin.help_tags()
			end,
			"Help Tags",
		},
	},
}, { prefix = "<leader>" })
