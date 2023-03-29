-----------------------------------------------
-- Neovim global settings
-----------------------------------------------
-- mostly base Vim/system wide things
-- reasonable defaults and a few personal prefs
-----------------------------------------------

-----------------------------------------------
-- Neovim API aliases
--local map = vim.api.nvim_set_keymap  -- set global keymap
local cmd = vim.cmd     				-- execute Vim commands
local g = vim.g         				-- global variables
local opt = vim.opt         		-- global/buffer/windows-scoped options

-----------------------------------------------
-- general system settings
g.mapleader = " "             -- change <leader> to a space
g.maplocalleader = ","           -- change <localleader> to a comma
opt.mouse = "a"               -- enable mouse support
-- opt.clipboard = "unnamedplus" -- copy/paste to system clipboard
opt.swapfile = false          -- don't use swapfile
vim.cmd [[
	syntax enable
	filetype plugin on
]]
vim.o.fileencoding = "utf-8"

-----------------------------------------------
-- vim ui
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
opt.sidescrolloff = 5
opt.termguicolors = true

-----------------------------------------------
-- NetRW file tree settings
-- default file viewer, a few things to make it work nicely
g.netrw_banner = 0
g.netrw_liststyle = 0
g.netrw_keepdir = 0
g.netrw_winsize = 25
g.netrw_localcopydircmd = 'cp -r'
g.netrw_browse_split = 0

-----------------------------------------------
-- tabs, indent settings
opt.expandtab = false     -- use tabs, not spaces
opt.shiftwidth = 2        -- shift 4 spaces when tab
opt.tabstop = 2           -- 1 tab == 4 spaces
opt.softtabstop = 2       -- 1 tab == 4 spaces
opt.smartindent = true    -- autoindent new lines

-----------------------------------------------
-- don't auto comment new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-----------------------------------------------
-- remove line length marker for selected filetypes
cmd [[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]]

-----------------------------------------------
-- listchars
-- characters to use for whitescpace
opt.listchars = {
	space = '·',
	tab = '>-',
	trail = '_',
	eol = '↵',
	nbsp = '+'
}

vim.o.list = false

-----------------------------------------------
-- autocompletion
-- insert mode completion options
opt.completeopt = 'menuone,noselect'

-----------------------------------------------
-- terminal
-- open a terminal pane on the right using :Term
cmd [[command Term :botright vsplit term://$SHELL]]

-- terminal visual tweaks
-- enter insert mode when switching to terminal
-- close terminal buffer on process exit
cmd [[
    autocmd TermOpen * setlocal listchars= nonumber norelativenumber nocursorline
    autocmd TermOpen * startinsert
    autocmd BufLeave term://* stopinsert
]]


-----------------------------------------------
-- filetypes
-- any filetype overrides that I run into
cmd [[
	au BufNewFile,BufRead *.glsl set filetype=glsl
]]

-----------------------------------------------
-- python
-- turn off the default styling and take care of it myself
g.python_recommended_style = 0
cmd [[
	au FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
]]


-----------------------------------------------
-- tidal
g.tidal_target = "terminal"

-----------------------------------------------
-- R
cmd [[
	au FileType r setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
]]
cmd [[
	au FileType rmd setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
]]
g.R_csv_app = 'terminal:vd'

-----------------------------------------------
-- haskell
-- use spaces instead of tabs for haskell programming
cmd [[
	au FileType haskell setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
]]
