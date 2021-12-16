-----------------------------------------------------------
-- Neovim settings
-----------------------------------------------------------

-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
--local map = vim.api.nvim_set_keymap  -- set global keymap
local cmd = vim.cmd     				-- execute Vim commands
local exec = vim.api.nvim_exec 	-- execute Vimscript
local fn = vim.fn       				-- call Vim functions
local g = vim.g         				-- global variables
local opt = vim.opt         		-- global/buffer/windows-scoped options

-----------------------------------------------------------
-- General
-----------------------------------------------------------
g.mapleader = " "             -- change leader to a space
opt.mouse = "a"               -- enable mouse support
-- opt.clipboard = "unnamedplus" -- copy/paste to system clipboard
opt.swapfile = false          -- don't use swapfile
vim.cmd [[
	syntax enable
	filetype plugin on
]]
vim.o.fileencoding = "utf-8"

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.showmatch = true
opt.splitright = true
opt.splitbelow = true
opt.ignorecase = true
opt.smartcase = true
opt.cmdheight = 1
opt.scrolloff = 8
opt.termguicolors = false

-----------------------------------------------------------
-- NetRW
-----------------------------------------------------------
g.netrw_banner = 0
g.netrw_liststyle = 3
g.netrw_keepdir = 0
g.netrw_winsize = 25
g.netrw_localcopydircmd = 'cp -r'

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = false     -- use tabs, not spaces
opt.shiftwidth = 4        -- shift 4 spaces when tab
opt.tabstop = 4           -- 1 tab == 4 spaces
opt.softtabstop = 4       -- 1 tab == 4 spaces
opt.smartindent = true    -- autoindent new lines

-- don't auto commenting new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- remove line length marker for selected filetypes
cmd [[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]]

-----------------------------------------------------------
-- Autocompletion
-----------------------------------------------------------
-- insert mode completion options
opt.completeopt = 'menuone,noselect'

-----------------------------------------------------------
-- Terminal
-----------------------------------------------------------
-- open a terminal pane on the right using :Term
cmd [[command Term :botright vsplit term://$SHELL]]

-- Terminal visual tweaks
--- enter insert mode when switching to terminal
--- close terminal buffer on process exit
cmd [[
    autocmd TermOpen * setlocal listchars= nonumber norelativenumber nocursorline
    autocmd TermOpen * startinsert
    autocmd BufLeave term://* stopinsert
]]


-----------------------------------------------------------
-- Filetypes
-----------------------------------------------------------
cmd [[
	au BufNewFile,BufRead *.glsl set filetype=glsl
]]

