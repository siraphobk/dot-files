local map = vim.keymap

vim.g.mapleader = " "

-- Navigation
map.set("n", "<C-M-h>", "<C-w>h")
map.set("n", "<C-M-j>", "<C-w>j")
map.set("n", "<C-M-k>", "<C-w>k")
map.set("n", "<C-M-l>", "<C-w>l")
map.set("t", "<C-M-h>", "<C-\\><C-N><C-w>h")
map.set("t", "<C-M-j>", "<C-\\><C-N><C-w>j")
map.set("t", "<C-M-k>", "<C-\\><C-N><C-w>k")
map.set("t", "<C-M-l>", "<C-\\><C-N><C-w>l")
map.set("i", "<C-M-h>", "<C-\\><C-N><C-w>h")
map.set("i", "<C-M-j>", "<C-\\><C-N><C-w>j")
map.set("i", "<C-M-k>", "<C-\\><C-N><C-w>k")
map.set("i", "<C-M-l>", "<C-\\><C-N><C-w>l")

-- Window management
map.set("n", "<C-w>>", "10<C-w>>") -- adjust width
map.set("n", "<C-w><", "10<C-w><")
map.set("n", "<C-w>+", "10<C-w>+") -- adjust height
map.set("n", "<C-w>-", "10<C-w>-")
