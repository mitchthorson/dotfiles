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
