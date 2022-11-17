-----------------------------------------------
-- color settings
-----------------------------------------------
-- currently using dracula via
-- https://github.com/Mofiqul/dracula.nvim 
-- with a few personal touches/overrides below
-----------------------------------------------


local colorscheme = "nord"
local transparent_bg = true

vim.o.background = "dark"
vim.cmd("colorscheme " .. colorscheme)
if (transparent_bg) then
	vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
end

-- require("colors.dracula")

-----------------------------------------------
-- custom highlights
vim.cmd(string.format("hi StatusLine gui=NONE guibg=NONE ctermbg=NONE"))
vim.cmd("hi SignColumn guibg=NONE ctermbg=NONE")
vim.cmd("hi DiagnosticSignError guibg=NONE ctermbg=NONE")
vim.cmd("hi DiagnosticSignHint guibg=NONE ctermbg=NONE")
vim.cmd("hi DiagnosticSignInfo guibg=NONE ctermbg=NONE")
vim.cmd("hi DiagnosticSignWarn guibg=NONE ctermbg=NONE")
vim.cmd("hi TelescopeNormal guibg=NONE ctermbg=NONE")


-----------------------------------------------
-- custom italic and syntax settings
vim.cmd("hi TSMethod gui=italic")
vim.cmd("hi TSFunction gui=italic")


