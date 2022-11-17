local palette = require('dracula').colors()

vim.g.nvim_tree_refresh_wait = 250

require'nvim-tree'.setup {
	open_on_setup    = false,
	view = {
		width = 30,
	},
	renderer = {
		indent_markers = {
			enable = false,
		},
		icons = {
			show = {
				git = false,
				folder = true,
				file = false,
				folder_arrow = false,
			},
			glyphs = {
					folder = {
					arrow_open = '',
					arrow_closed = '',
					default = '',
					open = '',
				}
			},
		}
	},
	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
}


vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
vim.cmd("hi NvimTreeVertSplit guibg=NONE ctermbg=NONE")
vim.cmd("hi NvimTreeNormal guibg=NONE ctermbg=NONE")
