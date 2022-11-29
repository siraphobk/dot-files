-- launch.json attributes <https://github.com/golang/vscode-go/blob/master/docs/debugging.md#launchjson-attributes>
-- VSCode Golang debugging <https://github.com/golang/vscode-go/blob/master/docs/debugging.md>

vim.keymap.set("n", "<F4>", ":DapToggleBreakpoint<CR>")
vim.keymap.set("n", "<F5>", ":DapContinue<CR>")
vim.keymap.set("n", "<F6>", ":DapStepOver<CR>")
vim.keymap.set("n", "<F7>", ":DapStepInto<CR>")
vim.keymap.set("n", "<F8>", ":DapStepOut<CR>")
