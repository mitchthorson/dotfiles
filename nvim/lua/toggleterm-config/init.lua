require("toggleterm").setup{
	direction = 'float',
	float_opts = {
		border = 'curved',
		winblend = 10,
	}
}

local map = vim.api.nvim_set_keymap
map('n', '<C-t>', '<Cmd>exe v:count1 . "ToggleTerm"<CR>', {noremap = true}) 