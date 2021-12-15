local map = vim.api.nvim_set_keymap
-- use alt + hjkl to resize windows
map('n', '<M-j>', ':resize -2<CR>', {noremap = true}) 
map('n', '<M-k>', ':resize +2<CR>', {noremap = true}) 
map('n', '<M-h>', ':vertical resize -2<CR>', {noremap = true}) 
map('n', '<M-l>', ':vertical resize +2<CR>', {noremap = true}) 

-- reload nvim configuration
map('n', '<Leader><CR>', ':so ~/.config/nvim/init.lua<CR>', {noremap = true})

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

-- avoid ESC
map('i', 'jk', '<ESC>', {noremap = true})
map('i', 'kj', '<ESC>', {noremap = true})

-- terminal
map('t', '<ESC>', '<C-\\><C-N>', {noremap = true})
