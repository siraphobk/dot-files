local function comment_setup()
  require("Comment").setup({
    toggler = {
      line = "<leader>gc",
      block = "<leader>gb",
    },
    opleader = {
      line = "<leader>gc",
      block = "<leader>gb",
    },
  })
end

return {
  configure = comment_setup,
}
