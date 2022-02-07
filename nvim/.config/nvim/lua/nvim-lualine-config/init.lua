require('lualine').setup {
	options = {
		theme = 'catppuccin',
		section_separators = { left = '', right = ''},
		component_separators = { left = '|', right = '|'},
	},
	sections = {
		lualine_b = {
			{
				'branch',
				-- icons_enabled = false,
			},
			'diff',
			'diagnostics',
		},
		lualine_c = {
			{
				'filename',
				path = 1,
			}
		},
		lualine_x = {
			'encoding',
			{
				'fileformat',
				icons_enabled = false,
			},
			{
				'filetype',
				-- icons_enabled = false,
				colored = false,
			},
		},
	},
}
