require("toggleterm").setup{
	direction = 'float',
	float_opts = {
		border = 'curved',
		winblend = 10,
	},
	size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
}

local map = vim.api.nvim_set_keymap
map('n', '<C-t>', '<Cmd>exe v:count1 . "ToggleTerm"<CR>', {noremap = true}) 
