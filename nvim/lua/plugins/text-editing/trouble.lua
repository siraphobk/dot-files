require("trouble").setup({})

local status, which_key = pcall(require, "which-key")
if not status then
  error("which-key is not found")
  return
end

which_key.register({
      ["<leader>"] = {
    name = "Trouble",
    x = {
      name = "Trouble",
      x = { "<cmd>TroubleToggle<cr>", "Toggle" },
      w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics" },
      d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics" },
      l = { "<cmd>TroubleToggle loclist<cr>", "Loclist" },
      q = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix" },
      g = { "<cmd>TroubleToggle lsp_references<cr>", "LSP References" },
    },
  },
})
