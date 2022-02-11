local palette = require("gruvbox.colors")

vim.g.nvim_tree_indent_markers = 0
vim.g.nvim_tree_refresh_wait = 250
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_show_icons = {
	git = 0,
	folders = 1,
	files = 0,
	folder_arrows = 0
}
vim.g.nvim_tree_icons = {
	folder = {
		arrow_open = '',
		arrow_closed = '',
		default = '',
		open = ''
	}
}
require'nvim-tree'.setup {
	open_on_setup    = false,
	auto_close       = false,
	view = {
		width = 30,
		auto_resize = true
	}
}


vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
-- vim.cmd(string.format("hi NvimTreeIndentMarker guifg=%s", palette.gray2))
vim.cmd(string.format("hi NvimTreeFolderIcon guifg=%s", palette.neutral_yellow))
vim.cmd(string.format("hi NvimTreeFolderName guifg=%s", palette.neutral_aqua))
vim.cmd(string.format("hi NvimTreeOpenedFolderName guifg=%s", palette.neutral_blue))
-- vim.cmd("hi NvimTreeVertSplit guibg=NONE ctermbg=NONE")
-- vim.cmd(string.format("hi NvimTreeRootFolder guifg=%s", "#fe8019"))
