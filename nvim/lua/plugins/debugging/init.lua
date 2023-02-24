return {
  {
    "mfussenegger/nvim-dap",
    build = "go install github.com/go-delve/delve/cmd/dlv@latest",
    config = function()
      require("plugins.debugging.dap")
    end,
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        config = function()
          require("plugins.debugging.dapui")
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
  {
    "Weissle/persistent-breakpoints.nvim",
    config = function()
      require('persistent-breakpoints').setup {
        save_dir = vim.fn.stdpath('data') .. '/nvim_checkpoints',
        -- when to load the breakpoints? "BufReadPost" is recommanded.
        load_breakpoints_event = { "BufReadPost" },
        -- record the performance of different function. run :lua require('persistent-breakpoints.api').print_perf_data() to see the result.
        perf_record = false,
      }
    end,
  }
}
