local custom_theme = require'lualine.themes.gruvbox'

custom_theme.normal.b.bg = "#1c1c1c"
custom_theme.normal.c.bg = "#1c1c1c"

require('lualine').setup {
	options = {
		theme = custom_theme,
		section_separators = { left = '', right = ''},
		component_separators = { left = '⦚', right = '⦚'},
	},
	sections = {
		lualine_a = {
			{
				'mode',
				fmt = function (str)
					return string.format("%s %s", "", str)
				end
			},
		},
		lualine_b = {
			{
				'branch',
				-- icons_enabled = false,
			},
			'diff',
			'diagnostics',
			{
				'filename',
				path = 1,
				fmt = function(str)
					return string.format("%s %s", "", str)
				end
			}
		},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {
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
			'progress'
		},
		lualine_z = {}
	},
}
