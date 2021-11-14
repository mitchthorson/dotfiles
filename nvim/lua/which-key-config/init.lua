local wk = require("which-key")
local mappings = {
	q = {":q<CR>", "Quit"},
	Q = {":wq<CR>", "Save & quit"},
	w = {":w<CR>", "Write"},
	x = {":bdelete<CR>", "Close"},
	E = {":e ~/.config/nvim/init.lua<CR>", "Config"},
	f = {":Telescope find_files<CR>", "Find"},
	r = {":Telescope live_grep<CR>", "Live grep"}
}
local opts = {prefix = "<leader>"}
wk.register(mappings, opts)
