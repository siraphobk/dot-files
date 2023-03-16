local spectre = require("spectre")
spectre.setup()

local status, which_key = pcall(require, "which-key")
if not status then
  error("which-key is not found")
  return
end

which_key.register({
      ["<leader>"] = {
    name = "Spectre",
    S = {
      name = "Spectre",
      o = { spectre.open, "Open" },
      w = { spectre.open_visual, "Open Visual" },
      f = { spectre.open_file_search, "Open File Search" },
    },
  },
})
