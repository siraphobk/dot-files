local map = vim.keymap

map.set("n", "j", "gj")
map.set("n", "k", "gk")

vim.cmd([[
  setlocal wrap
  setlocal tw=80
  setlocal fo+=t
  setlocal linebreak
  setlocal spell
]])
