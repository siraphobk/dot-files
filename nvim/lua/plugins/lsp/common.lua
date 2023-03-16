local status, which_key = pcall(require, "which-key")
if not status then
  error("which-key not found")
  return
end

local set_keymaps = function(bufnr)
  which_key.register({
    g = {
      D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go to declaration" },
      d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go to definition" },
      i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Go to implementation" },
      t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Go to type definition" },
    },
    K = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
    gr = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
        ["<C-k>"] = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature help" },
        ["<leader>wa"] = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", "Add workspace folder" },
        ["<leader>wr"] = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", "Remove workspace folder" },
        ["<leader>wl"] = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
      "List workspace folders" },
        ["<leader>rn"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
        ["<leader>ca"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code action" },
        ["<leader>F"] = { function() vim.lsp.buf.format({ async = true }) end, "Format" },
  }, { buffer = bufnr })
end

local group = vim.api.nvim_create_augroup("Format", { clear = true })
local on_attach = function(client, bufnr)
  -- format on save
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = group,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr, async = false })
      end,
    })
  end

  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  set_keymaps(bufnr)
end

return {
  set_keymaps = set_keymaps,
  on_attach = on_attach,
}
