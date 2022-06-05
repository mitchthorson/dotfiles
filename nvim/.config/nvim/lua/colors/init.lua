-----------------------------------------------
-- color settings
-----------------------------------------------
-- currently using dracula via
-- https://github.com/Mofiqul/dracula.nvim 
-- with a few personal touches/overrides below
-----------------------------------------------

local palette = require('dracula').colors()

local colorscheme = "dracula"
local transparent_bg = true

vim.o.background = "dark"
vim.cmd("colorscheme " .. colorscheme)
if (transparent_bg) then
	vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
end

-----------------------------------------------
-- custom highlights
vim.cmd(string.format("hi StatusLine gui=NONE guibg=NONE ctermbg=NONE guifg=%s", palette.white))
vim.cmd("hi SignColumn guibg=NONE ctermbg=NONE")
vim.cmd("hi DiagnosticSignError guibg=NONE ctermbg=NONE")
vim.cmd("hi DiagnosticSignHint guibg=NONE ctermbg=NONE")
vim.cmd("hi DiagnosticSignInfo guibg=NONE ctermbg=NONE")
vim.cmd("hi DiagnosticSignWarn guibg=NONE ctermbg=NONE")
vim.cmd(string.format("hi LineNr guifg=%s", palette.white))
vim.cmd(string.format("hi CursorLine guibg=%s", palette.selection))
vim.cmd(string.format("hi CursorLineNr guifg=%s", palette.purple))
vim.cmd(string.format("hi StatusLineAccent1 gui=NONE guibg=NONE ctermbg=NONE guifg=%s", palette.purple))
vim.cmd(string.format("hi StatusLineAccent2 gui=NONE guibg=NONE ctermbg=NONE guifg=%s", palette.cyan))
vim.cmd(string.format("hi StatusLineAccent3 gui=NONE guibg=NONE ctermbg=NONE guifg=%s", palette.green))
vim.cmd(string.format("hi StatusLineAccent4 gui=NONE guibg=NONE ctermbg=NONE guifg=%s", palette.yellow))
vim.cmd(string.format("hi StatusLineAccent5 gui=NONE guibg=NONE ctermbg=NONE guifg=%s", palette.pink))
vim.cmd(string.format("hi StatusLineAccent6 gui=NONE guibg=NONE ctermbg=NONE guifg=%s", palette.orange))
vim.cmd(string.format("hi GitSignsCurrentLineBlame guifg=%s", palette.pink))

-----------------------------------------------
-- custom italic and syntax settings
vim.cmd(string.format("hi Comment gui=italic guifg=%s", palette.white))
vim.cmd("hi TSMethod gui=italic")
vim.cmd("hi TSFunction gui=italic")
vim.cmd(string.format("hi TSProperty guifg=%s", palette.pink))
-- vim.cmd(string.format("hi TSVariable guifg=%s", palette.pink))
