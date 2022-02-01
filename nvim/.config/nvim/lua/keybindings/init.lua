local map = vim.api.nvim_set_keymap
-- use alt + hjkl to resize windows
map('n', '<M-j>', ':resize -2<CR>', {noremap = true}) 
map('n', '<M-k>', ':resize +2<CR>', {noremap = true}) 
map('n', '<M-h>', ':vertical resize -2<CR>', {noremap = true}) 
map('n', '<M-l>', ':vertical resize +2<CR>', {noremap = true}) 

-- use TAB to cycle through buffers
map('n', '<TAB>', ':bnext<CR>', {noremap = true, silent = true})

-- basic window navigation
map('n', '<C-h>', '<C-w>h', {noremap = true})
map('n', '<C-j>', '<C-w>j', {noremap = true})
map('n', '<C-k>', '<C-w>k', {noremap = true})
map('n', '<C-l>', '<C-w>l', {noremap = true})

-- better indenting
map('v', '>', '>gv', {noremap = true})
map('v', '<', '<gv', {noremap = true})

-- terminal go to normal mode with escape
map('t', '<ESC>', '<C-\\><C-N>', {noremap = true})

-- yank to clipboard
map('v', '<leader>y', '"+y', {noremap = true})
map('n', '<leader>y', '"+y', {noremap = true})

-- move lines around more easily
map('v', 'J', ":m '>+1<CR>gv=gv", {noremap = true})
map('v', 'K', ":m '<-2<CR>gv=gv", {noremap = true})

-- Telescope shortcuts
map('n', '<leader>f', '<CMD>Telescope find_files<CR>', {noremap = true})
map('n', '<leader>F', '<CMD>Telescope live_grep<CR>', {noremap = true})
map('n', '<leader>r', '<CMD>Telescope lsp_references<CR>', {noremap = true})
