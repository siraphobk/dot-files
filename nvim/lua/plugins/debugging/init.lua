return {
  {
    "mfussenegger/nvim-dap",
    build = "go install github.com/go-delve/delve/cmd/dlv@latest",
    config = function()
      require("plugins.debugging.dap").configure()
    end,
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        config = function()
          require("plugins.debugging.dapui").configure()
        end,
      },
      {
        "theHamsta/nvim-dap-virtual-text",
        config = function()
          require("nvim-dap-virtual-text").setup({})
        end,
      },
    },
  },
}
