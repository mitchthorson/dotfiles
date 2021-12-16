local wk = require("which-key")
local Terminal = require("toggleterm.terminal").Terminal
local toggle_split = function()
	local term = Terminal:new({direction = "horizontal"})
	return term:toggle()
end
local toggle_vsplit = function()
	local term = Terminal:new({direction = "vertical"})
	return term:toggle()
end
local toggle_lazygit = function()
	local term = Terminal:new({cmd = "lazygit", direction = "float"})
	return term:toggle()
end
local mappings = {
	q = {":q<CR>", "Quit"},
	Q = {":wq<CR>", "Save & quit"},
	w = {":w<CR>", "Write"},
	x = {":bdelete<CR>", "Close"},
	E = {":e ~/dotfiles/nvim/.config/nvim/init.lua<CR>", "Config"},
	e = {":Vex<CR>", "Files"},
	f = {":Telescope find_files<CR>", "Find"},
	r = {":Telescope live_grep<CR>", "Live grep"},
	R = {":so ~/.config/nvim/init.lua<CR>", "Reload Vim config"},
	l = {
		name = "LSP",
		i = {":LspInfo<cr>", "Connected Language Servers"},
		A = {'<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', "Add workspace folder"},
		R = {'<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', "Remove workspace folder"},
		l = {'<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', "List workspace folder"},
		D = {'<cmd>lua vim.lsp.buf.type_definition()<CR>', "Type definition"},
		r = {'<cmd>lua vim.lsp.buf.rename()<CR>', "Rename"},
		a = {'<cmd>lua vim.lsp.buf.code_action()<CR>', "Code actions"},
		e = {'<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', "Show line diagnostics"},
		q = {'<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', "Show loclist"}
	  },
	t = {
		name = "Terminal",
		t = {":ToggleTerm<cr>", "Open terminal"},
		s = {toggle_split, "Open horizontal terminal"},
		v = {toggle_vsplit, "Open vertical terminal"},
		g = {toggle_lazygit, "Open lazygit"},
	}
}
local opts = {prefix = "<leader>"}
wk.register(mappings, opts)
