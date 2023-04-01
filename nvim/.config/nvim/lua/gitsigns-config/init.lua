return function()
	require('gitsigns').setup()

	vim.cmd("hi GitSignsAdd guibg=NONE ctermbg=NONE")
	vim.cmd("hi GitSignsChange guibg=NONE ctermbg=NONE")
	vim.cmd("hi GitSignsDelete guibg=NONE ctermbg=NONE")
end
