local palette = require("gruvbox.colors")

local colorscheme = "gruvbox"
local transparent_bg = false

-- gruvbox setup
-- vim.g.gruvbox_contrast_dark = "hard"
vim.g.gruvbox_invert_selection = false

vim.cmd("colorscheme " .. colorscheme)
if (transparent_bg and colorscheme == "gruvbox") then
	vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
end

--highlights
vim.cmd(string.format("hi StatusLine gui=NONE guibg=NONE ctermbg=NONE guifg=%s", palette.white))
vim.cmd(string.format("hi StatusLineAccent1 gui=NONE guibg=NONE ctermbg=NONE guifg=%s", palette.purple))
vim.cmd(string.format("hi StatusLineAccent2 gui=NONE guibg=NONE ctermbg=NONE guifg=%s", palette.blue))
vim.cmd(string.format("hi StatusLineAccent3 gui=NONE guibg=NONE ctermbg=NONE guifg=%s", palette.aqua))
vim.cmd(string.format("hi StatusLineAccent4 gui=NONE guibg=NONE ctermbg=NONE guifg=%s", palette.yellow))
vim.cmd(string.format("hi StatusLineAccent5 gui=NONE guibg=NONE ctermbg=NONE guifg=%s", palette.orange))
vim.cmd(string.format("hi StatusLineAccent6 gui=NONE guibg=NONE ctermbg=NONE guifg=%s", palette.red))
