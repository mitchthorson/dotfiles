return function()
	require("lualine").setup({
		options = {
			globalstatus = true,
			icons_enabled = false,
			component_separators = { left = "|", right = "|" },
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = { "filename" },
			lualine_x = { "encoding", "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
	})
	vim.api.nvim_set_keymap("n", "<leader>bh", ":lua require('lualine').hide()<CR>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "<leader>bb", ":lua require('lualine').hide({unhide = true})<CR>", { noremap = true, silent = true })
end

