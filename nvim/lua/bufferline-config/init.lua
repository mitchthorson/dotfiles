require("bufferline").setup{
	options = {
		diagnostics = "nvim_lsp",
		offsets = {
			{
				filetype = "NvimTree",
				text = "",
				highlight = "Directory",
				text_align = "left"
			}
		},
	},
}
