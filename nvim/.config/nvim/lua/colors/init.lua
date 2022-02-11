local catppuccin = require("catppuccin")

local colorscheme = "gruvbox"
local transparent_bg = false

-- gruvbox setup
vim.g.gruvbox_contrast_dark = "hard"
vim.g.gruvbox_invert_selection = false

-- catppuccin setup
catppuccin.setup({
	transparent_background = transparent_bg,
})

vim.cmd("colorscheme " .. colorscheme)
if (transparent_bg and colorscheme == "gruvbox") then
	vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
end
