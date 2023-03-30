local M = {}

M.init = function()
	vim.g.vimwiki_list = {{
		path = "~/SynologyDrive/wiki",
		syntax = "markdown",
		ext = "md"
	}}
end

return M
