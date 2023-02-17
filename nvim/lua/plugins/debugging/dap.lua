local dap = require("dap")

-- GO Configuration ------------------------------------------------------------

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

-- Set keymaps -----------------------------------------------------------------

vim.keymap.set("n", "<F4>", ":DapToggleBreakpoint<CR>")
vim.keymap.set("n", "<F5>", ":DapContinue<CR>")
vim.keymap.set("n", "<F6>", ":DapStepOver<CR>")
vim.keymap.set("n", "<F7>", ":DapStepInto<CR>")
vim.keymap.set("n", "<F8>", ":DapStepOut<CR>")
