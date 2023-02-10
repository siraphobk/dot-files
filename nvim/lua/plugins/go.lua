local go_file_types = { "go", "gomod", "gosum", "gotmpl", "gohtmltmpl", "gotexttmpl" }

return {
  {
    "ray-x/go.nvim",
    config = function()
      local p_lsp = require("plugins.configs.lspconfig") -- internal plugin import

      require("go").setup({
        luasnip = true,
        lsp_keymaps = p_lsp.set_keymaps,
        dap_debug = false
      })
    end,
    ft = go_file_types,
  },
  { "ray-x/guihua.lua" }
}
