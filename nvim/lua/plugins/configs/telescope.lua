require("telescope").setup({})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>Ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>Fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>Fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>Fh", builtin.help_tags, {})
