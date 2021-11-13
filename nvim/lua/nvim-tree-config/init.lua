vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_refresh_wait = 250

require'nvim-tree'.setup {
	open_on_setup    = true,
	auto_close       = true,
	view = {
		width = 30,
		auto_resize = true
	}
}

vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
