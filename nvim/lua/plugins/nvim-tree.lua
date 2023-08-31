local function setup()
  -- disable netrw at the very start of your init.lua (strongly advised)
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1

  -- set termguicolors to enable highlight groups
  vim.opt.termguicolors = true

  require("nvim-tree").setup({
    view = {
      adaptive_size = true,
      number = true,
      relativenumber = true,
    },
    renderer = {
      group_empty = true,
      add_trailing = true,
      highlight_opened_files = "all",
      indent_markers = {
        enable = true,
      },
    },
    filters = {
      dotfiles = false,
    },
    diagnostics = {
      enable = true,
      show_on_dirs = true,
    },
    git = {
      ignore = false,
    },
  })

  local nt_api = require("nvim-tree.api")
  local wk_ok, wk = pcall(require, "which-key")

  if not wk_ok then
    return
  end

  wk.register({
    t = {
      name = "Nvim-Tree",
      t = {
        function()
          nt_api.tree.toggle()
        end,
        "Toggle",
      },
      f = {
        function()
          nt_api.tree.find_file(vim.api.nvim_buf_get_name(0))
        end,
        "Find File in the Tree",
      },
      F = {
        function()
          nt_api.tree.focus()
        end,
        "Focus on the Tree",
      },
    },
  }, { prefix = "<leader>" })
end

return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    name = "nvim-tree-nvim-web-devicons",
    config = function()
      setup()
    end,
  },
}
