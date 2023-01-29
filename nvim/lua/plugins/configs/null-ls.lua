local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local function formatting(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({
          bufnr = bufnr,
          filter = function(c) -- client as an argument
            return c.name == "null-ls"
          end,
        })
      end,
    })
  end
end

-- table_concat appends all elements of t2 to t1
local function table_concat(t1, t2)
  for _, value in ipairs(t2) do
    table.insert(t1, value)
  end
end

local sources = {
  null_ls.builtins.formatting.prettierd,
  null_ls.builtins.formatting.goimports,
  null_ls.builtins.formatting.pg_format,
  null_ls.builtins.completion.spell,
}

local python_sources = {
  null_ls.builtins.formatting.autopep8,
  null_ls.builtins.diagnostics.flake8,
  null_ls.builtins.diagnostics.pydocstyle,
}
table_concat(sources, python_sources)

null_ls.setup({
  sources = sources,
  on_attach = formatting,
})
