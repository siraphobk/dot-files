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
  configure = dapui_setup,
}
