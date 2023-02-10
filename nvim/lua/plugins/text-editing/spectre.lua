local function spectre_setup()
  local spectre = require("spectre")
  spectre.setup()

  vim.keymap.set("n", "<leader>So", function()
    spectre.open()
  end)
  vim.keymap.set("n", "<leader>Sw", function()
    spectre.open_visual({ select_word = true })
  end)
  vim.keymap.set("n", "<leader>Sf", function()
    spectre.open_file_search()
  end)
end

return {
  configure = spectre_setup,
}
