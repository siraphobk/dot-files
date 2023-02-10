local function dap_setup()
  -- launchkjson attributes <https://github.com/golang/vscode-go/blob/master/docs/debugging.md#launchjson-attributes>
  -- VSCode Golang debugging <https://github.com/golang/vscode-go/blob/master/docs/debugging.md>

  vim.keymap.set("n", "<F4>", ":DapToggleBreakpoint<CR>")
  vim.keymap.set("n", "<F5>", ":DapContinue<CR>")
  vim.keymap.set("n", "<F6>", ":DapStepOver<CR>")
  vim.keymap.set("n", "<F7>", ":DapStepInto<CR>")
  vim.keymap.set("n", "<F8>", ":DapStepOut<CR>")

  local dap = require("dap")

  dap.adapters.go = {
    type = "server",
    host = "127.0.0.1",
    port = "${port}",
    executable = {
      command = "dlv",
      args = { "dap", "-l", "127.0.0.1:${port}" },
    },
  }

  -- Specific to Foundation Tilt
  dap.adapters.go_remote_tilt = {
    type = "server",
    host = "127.0.0.1",
    port = 19090,
  }

  -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
  dap.configurations.go = {
    {
      type = "go",
      name = "Debug",
      request = "launch",
      program = "${file}",
    },
    {
      type = "go",
      name = "Debug test",
      request = "launch",
      mode = "test",
      program = "${file}",
    },
    -- works with go.mod packages and sub packages
    {
      type = "go",
      name = "Debug test (go.mod)",
      request = "launch",
      mode = "test",
      program = "./${relativeFileDirname}",
    },
    {
      type = "go_remote_tilt",
      name = "Connect Tilt at port 19090",
      request = "attach",
      mode = "remote",
      host = "127.0.0.1",
      port = 19090,
      -- substitutePath = {
      -- 	{
      -- 		from = "${workspaceFolder}",
      -- 		to = "/go/app",
      -- 	},
      -- },
      debugAdapter = "dlv-dap",
    },
  }
end

local function dapui_setup()
  -- dap should be setup before executing this function
  local dap = require("dap")
  local dapui = require("dapui")

  local config = {
    layouts = {
      {
        elements = {
          { id = "scopes", size = 0.25 },
          "breakpoints",
          "stacks",
          "watches",
        },
        size = 40,
        position = "left",
      },
      {
        elements = { "repl" },
        size = 0.25, -- 25% of total lines
        position = "bottom",
      },
    },
  }

  vim.api.nvim_create_user_command("DapUI", "lua require('dapui').toggle()", {})

  dapui.setup(config)

  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open({
      reset = true,
    })
  end

  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close({})
    dapui.setup(config)
  end

  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close({})
    dapui.setup(config)
  end
end

return {
  {
    "mfussenegger/nvim-dap",
    build = "go install github.com/go-delve/delve/cmd/dlv@latest",
    config = function()
      dap_setup()
    end,
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        after = "nvim-dap",
        config = function()
          dapui_setup()
        end,
      },
      {
        "theHamsta/nvim-dap-virtual-text",
        after = "nvim-dap",
        config = function()
          require("nvim-dap-virtual-text").setup({})
        end,
      },
    },
  },
}
