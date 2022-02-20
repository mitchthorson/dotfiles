-- local palette = require("gruvbox.colors")
local palette = require('dracula').colors()

local colorscheme = "dracula"
local transparent_bg = true

-- gruvbox setup
-- vim.g.gruvbox_contrast_dark = "hard"
-- vim.g.gruvbox_invert_selection = true
vim.o.background = "dark"

vim.cmd("colorscheme " .. colorscheme)

if (transparent_bg) then
	vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
end

--highlights
vim.cmd(string.format("hi StatusLine gui=NONE guibg=NONE ctermbg=NONE guifg=%s", palette.white))
vim.cmd("hi SignColumn guibg=NONE ctermbg=NONE")
vim.cmd("hi DiagnosticSignError guibg=NONE ctermbg=NONE")
vim.cmd("hi DiagnosticSignHint guibg=NONE ctermbg=NONE")
vim.cmd("hi DiagnosticSignInfo guibg=NONE ctermbg=NONE")
vim.cmd("hi DiagnosticSignWarn guibg=NONE ctermbg=NONE")
vim.cmd(string.format("hi LineNr guifg=%s", palette.gutter_fg))
vim.cmd(string.format("hi CursorLine guibg=%s", palette.selection))
vim.cmd(string.format("hi CursorLineNr guibg=%s guifg=%s", palette.dark1, palette.white))
vim.cmd(string.format("hi StatusLineAccent1 gui=NONE guibg=NONE ctermbg=NONE guifg=%s", palette.purple))
vim.cmd(string.format("hi StatusLineAccent2 gui=NONE guibg=NONE ctermbg=NONE guifg=%s", palette.cyan))
vim.cmd(string.format("hi StatusLineAccent3 gui=NONE guibg=NONE ctermbg=NONE guifg=%s", palette.green))
vim.cmd(string.format("hi StatusLineAccent4 gui=NONE guibg=NONE ctermbg=NONE guifg=%s", palette.yellow))
vim.cmd(string.format("hi StatusLineAccent5 gui=NONE guibg=NONE ctermbg=NONE guifg=%s", palette.pink))
vim.cmd(string.format("hi StatusLineAccent6 gui=NONE guibg=NONE ctermbg=NONE guifg=%s", palette.orange))
vim.cmd(string.format("hi GitSignsCurrentLineBlame guifg=%s", palette.pink))

-- custom italic settings
vim.cmd("hi Comment gui=italic")
vim.cmd("hi TSMethod gui=italic")
vim.cmd("hi TSFunction gui=italic")
