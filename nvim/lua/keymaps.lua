local map = vim.keymap

vim.g.mapleader = " "

-- Navigation
map.set("n", "<C-h>", "<C-w>h")
map.set("n", "<C-l>", "<C-w>l")
map.set("n", "<C-j>", "<C-w>j")
map.set("n", "<C-k>", "<C-w>k")
map.set("t", "<C-h>", "<C-\\><C-N><C-w>h")
map.set("t", "<C-j>", "<C-\\><C-N><C-w>j")
map.set("t", "<C-k>", "<C-\\><C-N><C-w>k")
map.set("t", "<C-l>", "<C-\\><C-N><C-w>l")
map.set("i", "<C-h>", "<C-\\><C-N><C-w>h")
map.set("i", "<C-j>", "<C-\\><C-N><C-w>j")
map.set("i", "<C-k>", "<C-\\><C-N><C-w>k")
map.set("i", "<C-l>", "<C-\\><C-N><C-w>l")

-- Window management
map.set("n", "<C-w>>", "10<C-w>>") -- adjust width
map.set("n", "<C-w><", "10<C-w><")
map.set("n", "<C-w>+", "10<C-w>+") -- adjust height
map.set("n", "<C-w>-", "10<C-w>-")
