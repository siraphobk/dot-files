local harpoon = require("harpoon")
require("telescope").load_extension('harpoon')

harpoon.setup({
  menu = {
    width = vim.api.nvim_win_get_width(0) - 20,
  }
})

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  error("which-key is not found")
  return
end

local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")

-- register harpoon keymaps
which_key.register({
  ["<leader>h"] = {
    name = "+harpoon",
    a = {
      function()
        harpoon_mark.add_file()
        -- print the current file path
        local file_path = vim.fn.expand("%:p")
        print(file_path .. "added to harpoon marks")
      end,
      "add file" },
    j = { harpoon_ui.nav_next, "next" },
    k = { harpoon_ui.nav_prev, "prev" },
    l = {
      "<cmd>Telescope harpoon marks<cr>",
      "telescope marks",
    },
    t = { harpoon_ui.toggle_quick_menu, "list" },
  },
})
