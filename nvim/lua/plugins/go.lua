local go_file_types = { "go", "gomod", "gosum", "gotmpl", "gohtmltmpl", "gotexttmpl" }

return {
  {
    "ray-x/go.nvim",
    config = function()
      require("plugins.configs.go-nvim")
    end,
    ft = go_file_types,
  },
  { "ray-x/guihua.lua" }
}
