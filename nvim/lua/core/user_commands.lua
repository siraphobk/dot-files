-- Print directory of the current buffer
vim.api.nvim_create_user_command("Dir", function()
	print(vim.fn.expand("%:p"))
end, {})
