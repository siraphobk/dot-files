local map = vim.keymap

map.set("n", "j", "gj")
map.set("n", "k", "gk")

vim.cmd([[
  setlocal wrap
  setlocal fo+=t
  setlocal linebreak
  setlocal spell
]])
