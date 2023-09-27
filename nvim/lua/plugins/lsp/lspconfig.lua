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

vim.diagnostic.config({
  underline = true,
  virtual_text = true,
  signs = true,
  float = {
    border = "rounded",
    header = "-- Diagnostic --"
  },
})

-- Set keymaps for diagnostics
local wk = require("which-key")
wk.register({
  ["<leader>do"] = { "<cmd>lua vim.diagnostic.open_float(0, { scope = 'line' })<CR>", "Open diagnostics" },
  ["<leader>d["] = { "<cmd>lua vim.diagnostic.goto_prev({ scope = 'line' })<CR>", "Previous diagnostic" },
  ["<leader>d]"] = { "<cmd>lua vim.diagnostic.goto_next({ scope = 'line' })<CR>", "Next diagnostic" },
  ["<leader>ds"] = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "Set location list" },
})

-- Language Server Configurations
local common = require("plugins.lsp.common")
local lspconfig = require("lspconfig")
local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()
cmp_capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true
}

-- For golangci_lint_ls specifically
local on_publish_diagnostics = vim.lsp.handlers["textDocument/publishDiagnostics"]

local servers = {
  "clangd",
  "html",
  "gopls",
  -- needs golanci-lint-ls
  -- go install github.com/nametake/golangci-lint-langserver@latest
  -- go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
  {
    -- The reason why we need to implement our own handler is because of this issue: <https://github.com/folke/trouble.nvim/issues/224>
    name = "golangci_lint_ls",
    config = {
      handlers = {
        -- stops an out-of-range column error when viewing diagnostics with Trouble.nvim
        ["textDocument/publishDiagnostics"] = function(_, result, ctx, config)
          for idx, diag in ipairs(result.diagnostics) do
            for position, value in pairs(diag.range) do
              if value.character == -1 then
                result.diagnostics[idx].range[position].character = 0
              end
            end
          end

          return on_publish_diagnostics(_, result, ctx, config)
        end,
      },
    }
  },
  "graphql",
  "jsonls",
  "pyright",
  "rust_analyzer",
  "svelte",
  "sqlls",
  "tsserver",
  "tailwindcss",
  {
    name = "lua_ls",
    config = {
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
      capabilities = cmp_capabilities,
    }
  }
}

for _, server in ipairs(servers) do
  if type(server) == "string" then
    if server == "gopls" then
      local cfg = require("go.lsp").config()
      lspconfig[server].setup(cfg)
    else
      lspconfig[server].setup({
        on_attach = common.on_attach,
        capabilities = cmp_capabilities,
      })
    end
  elseif type(server) == "table" then
    lspconfig[server.name].setup(server.config)
  else
    error("invalid server type")
  end
end
