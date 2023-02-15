local dap = require("dap")
local dapui = require("dapui")

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open({ reset = true })
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close({})
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close({})
end

vim.api.nvim_create_user_command("DapUI", "lua require('dapui').toggle()", {})

vim.fn.sign_define('DapBreakpoint', { text = '🟥', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '▶️', texthl = '', linehl = '', numhl = '' })

dapui.setup({
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
      size = 0.25,
      position = "bottom",
    },
  },
})
