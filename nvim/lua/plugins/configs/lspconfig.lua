local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>do", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<leader>ds", vim.diagnostic.setloclist, opts)

local set_keymaps = function(bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<leader>F", function()
    vim.lsp.buf.format({ async = true })
  end, bufopts)

  -- NOTE: Requires "ufo" folding plugins
  -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
  vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
  vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
end

local group = vim.api.nvim_create_augroup("Format", { clear = true })
local on_attach = function(client, bufnr)
  -- format on save
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = group,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({
          bufnr = bufnr,
          async = false,
        })
      end,
    })
  end

  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  set_keymaps(bufnr)
end

-- Language Server Configs

local lspconfig = require("lspconfig")
local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()

-- NOTE: Requires ufo folding plugin
-- Handling folding (see https://github.com/kevinhwang91/nvim-ufo#setup-and-description)
cmp_capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

local servers = { "gopls", "rust_analyzer", "graphql", "tsserver", "pyright" }

for _, server in ipairs(servers) do
  lspconfig[server].setup({
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = cmp_capabilities,
  })
end

lspconfig.sumneko_lua.setup({
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = cmp_capabilities,
})

-- NOTE: Require ufo folding plugin
require('ufo').setup()

-- Exported

M = {
  on_attach = on_attach,
  set_keymaps = set_keymaps,
}

return M
