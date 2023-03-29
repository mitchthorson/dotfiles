local M = {}

M.init = function()
	vim.g.vimwiki_list = {{
		path = "~/wiki",
		syntax = "markdown",
		ext = "md"
	}}
end

return M
