local map = vim.keymap

map.set("n", "j", "gj")
map.set("n", "k", "gk")

vim.cmd([[setlocal wrap]])
vim.cmd([[setlocal tw=80]])
vim.cmd([[setlocal fo+=t]])
vim.cmd([[setlocal linebreak]])
vim.cmd([[setlocal spell]])
