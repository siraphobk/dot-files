local filetypes = require("formatter.filetypes")

require("formatter").setup {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    graphql = {
      filetypes.graphql.prettierd,
    },
    markdown = {
      filetypes.markdown.prettierd,
    },
    sql = {
      filetypes.sql.pgformat,
    },

    -- Use the special "*" filetype for defining formatter configurations on
    -- any filetype
    ["*"] = {
      -- "formatter.filetypes.any" defines default configurations for any
      -- filetype
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}

local group = vim.api.nvim_create_augroup("Formatter_Format", { clear = true })

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  group = group,
  pattern = "*",
  command = "FormatWrite",
})
