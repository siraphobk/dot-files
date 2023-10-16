local api = vim.api

api.nvim_create_augroup('setft', {
  clear = true,
})

api.nvim_create_autocmd('BufEnter', {
  group = "setft",
  pattern = { "Dockerfile*" },
  desc = "set filetype for Dockerfile",
  callback = function(v)
    vim.bo.filetype = "dockerfile"
  end
})

api.nvim_create_autocmd('BufEnter', {
  group = "setft",
  pattern = { "Tiltfile*" },
  desc = "set filetype for Tiltfile",
  callback = function(v)
    vim.bo.filetype = "starlark"
  end
})
