return function()
	require('gitsigns').setup()

	vim.cmd("hi GitSignsAdd guibg=None ctermbg=None")
	vim.cmd("hi GitSignsChange guibg=None ctermbg=None")
	vim.cmd("hi GitSignsDelete guibg=None ctermbg=None")
end
