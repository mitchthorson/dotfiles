-----------------------------------------------
-- keybindings
-----------------------------------------------
-- any and all custom keybindings,
-- except those that need to be configured with plugin dependencies
-----------------------------------------------

-- alias for setting keymaps
local map = vim.api.nvim_set_keymap

-----------------------------------------------

-- use alt + hjkl to resize windows
map('n', '<M-j>', ':resize -2<CR>', {noremap = true})
map('n', '<M-k>', ':resize +2<CR>', {noremap = true})
map('n', '<M-h>', ':vertical resize -2<CR>', {noremap = true})
map('n', '<M-l>', ':vertical resize +2<CR>', {noremap = true})

-- use TAB to cycle through buffers
-- map('n', '<TAB>', ':bnext<CR>', {noremap = true, silent = true})

-- basic window navigation with vim directions
map('n', '<C-h>', '<C-w>h', {noremap = true})
map('n', '<C-j>', '<C-w>j', {noremap = true})
map('n', '<C-k>', '<C-w>k', {noremap = true})
map('n', '<C-l>', '<C-w>l', {noremap = true})

-- better indenting
map('v', '>', '>gv', {noremap = true})
map('v', '<', '<gv', {noremap = true})

-- terminal goes to normal mode with <esc>
map('t', '<ESC>', '<C-\\><C-n>', {noremap = true})

-- yank to system clipboard with +y
map('v', '<leader>y', '"+y', {noremap = true})
map('n', '<leader>y', '"+y', {noremap = true})

-- move whole lines around more easily in visual line mode
map('v', 'J', ":m '>+1<CR>gv=gv", {noremap = true})
map('v', 'K', ":m '<-2<CR>gv=gv", {noremap = true})

-- listchars toggle
-- hide or show listchars with <leader>z
map('n', '<leader>z', ':set list!<CR>', {noremap = true})

-- search highlight
-- turn off the post search higlights with <leader>x
map('n', '<leader>x', ':noh<CR>', {noremap = true})

-- jump to my vim journal from anywhere
-- as long as its in ~/wiki/notes/Vim Journal.md
map('n', '<leader>vj', ':e ~/wiki/notes/Vim Journal.md<CR>', {noremap = true})

-- Toggle NetRW  
-- deprecated for now
-- I've moved to nvimtree
-- we'll see if it lasts
-- map('n', '<C-n>', ':Lex<CR>', {noremap = true, silent = true})

-----------------------------------------------
-- vim-fugitive
-- https://github.com/tpope/vim-fugitive
-- ok one third pary plugin, but only because
-- vim-fugitive doesn't have any other configuration
-- so no where else to put this
map('n', '<leader>gs', ':G<CR>', {noremap = true})
map('n', '<leader>gc', ':G commit<CR>', {noremap = true})
map('n', '<leader>gp', ':G push<CR>', {noremap = true})
map('n', '<leader>gj', ':diffget //3<CR>', {noremap = true})
map('n', '<leader>gf', ':diffget //2<CR>', {noremap = true})


