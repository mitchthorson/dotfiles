-----------------------------------------------
-- color settings
-----------------------------------------------
-- currently using dracula via
-- https://github.com/Mofiqul/dracula.nvim 
-- with a few personal touches/overrides below
-----------------------------------------------


vim.env.colorscheme = "rose-pine"
vim.env.transparent_bg = true
vim.o.background = "dark"

local function set_color(colorname)
	vim.cmd("colorscheme " .. colorname)
	vim.env.colorscheme = colorname
	if (vim.env.transparent_bg) then
		vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
		vim.cmd("hi CursorLine guibg=NONE")
		vim.cmd("hi CursorLineNr guifg=NONE")
		vim.cmd("hi StatusLineAccent1 gui=NONE guibg=NONE ctermbg=NONE")
		vim.cmd("hi StatusLineAccent2 gui=NONE guibg=NONE ctermbg=NONE")
		vim.cmd("hi StatusLineAccent3 gui=NONE guibg=NONE ctermbg=NONE")
		vim.cmd("hi StatusLineAccent4 gui=NONE guibg=NONE ctermbg=NONE")
		vim.cmd("hi StatusLineAccent5 gui=NONE guibg=NONE ctermbg=NONE")
		vim.cmd("hi StatusLineAccent6 gui=NONE guibg=NONE ctermbg=NONE")
		vim.cmd("hi ZenBg gui=NONE guibg=NONE ctermbg=NONE")
		vim.cmd("hi NvimTreeVertSplit guibg=NONE ctermbg=NONE")
		vim.cmd("hi NvimTreeNormal guibg=NONE ctermbg=NONE")
		vim.cmd("hi GitSignsAdd guibg=None ctermbg=None")
		vim.cmd("hi GitSignsChange guibg=None ctermbg=None")
		vim.cmd("hi GitSignsDelete guibg=None ctermbg=None")
	end
	if (colorname == "dracula") then
		package.loaded["colors.dracula"] = nil
		require("colors.dracula")
	end
	-----------------------------------------------
	-- custom highlights
	vim.cmd(string.format("hi StatusLine gui=NONE guibg=NONE ctermbg=NONE"))
	vim.cmd("hi SignColumn guibg=NONE ctermbg=NONE")
	vim.cmd("hi DiagnosticSignError guibg=NONE ctermbg=NONE")
	vim.cmd("hi DiagnosticSignHint guibg=NONE ctermbg=NONE")
	vim.cmd("hi DiagnosticSignInfo guibg=NONE ctermbg=NONE")
	vim.cmd("hi DiagnosticSignWarn guibg=NONE ctermbg=NONE")
	-- vim.cmd("hi TelescopeNormal guibg=NONE ctermbg=NONE")
	-----------------------------------------------
	-- custom italic and syntax settings
	vim.cmd("hi TSMethod gui=italic")
	vim.cmd("hi TSFunction gui=italic")

end

set_color(vim.env.colorscheme)

local function set_color_command(opts)
	local new_color = opts.fargs[1]
	set_color(new_color)
end

local function toggle_transparent()
	vim.env.transparent_bg = not vim.env.transparent_bg
	print("Transparent "..tostring(vim.env.transparent_bg))
	set_color(vim.env.colorscheme)
end

local function toggle_light ()
	if (vim.o.background == "light") then
		vim.o.background = "dark"
	else
		vim.o.background = "light"
	end
end

vim.api.nvim_create_user_command("SetColor", set_color_command, {
	nargs = 1
})

vim.api.nvim_create_user_command("ToggleTransparent", toggle_transparent, {
	nargs = 0
})

vim.api.nvim_create_user_command("ToggleLight", toggle_light, {
	nargs = 0
})
