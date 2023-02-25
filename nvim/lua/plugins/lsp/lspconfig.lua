-- Set border of signature help and hover
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  { border = "rounded" }
)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover,
  { border = "rounded" }
)

require('lspconfig.ui.windows').default_options = {
  border = "rounded"
}

local opts = { noremap = true, silent = true }

vim.diagnostic.config({
  underline = true,
  virtual_text = true,
  signs = true,
  float = {
    border = "rounded",
    header = "-- Diagnostic --"
  },
})

vim.keymap.set("n", "<leader>do", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<leader>ds", vim.diagnostic.setloclist, opts)

-- Language Server Configs

local common = require("plugins.lsp.common")
local lspconfig = require("lspconfig")
local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()

cmp_capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true
}

local servers = {
  "gopls",
  "rust_analyzer",
  "graphql",
  "tsserver",
  "pyright",
  "html",
  "svelte",
  "tailwindcss",
}

for _, server in ipairs(servers) do
  lspconfig[server].setup({
    on_attach = common.on_attach,
    flags = lsp_flags,
    capabilities = cmp_capabilities,
  })
end

lspconfig.lua_ls.setup({
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
  on_attach = common.on_attach,
  flags = lsp_flags,
  capabilities = cmp_capabilities,
})
