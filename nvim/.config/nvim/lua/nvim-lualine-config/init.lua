local custom_theme = require('lualine.themes.catppuccin')
local palette = require('catppuccin.core.color_palette')

-- custom_theme.normal.a.fg = palette.black4
custom_theme.normal.a.bg = palette.peach
custom_theme.normal.b.fg = palette.peach
custom_theme.normal.b.bg = palette.black0
custom_theme.insert.b.fg = palette.green
custom_theme.insert.b.bg = palette.black0
custom_theme.command.a.bg = palette.red
custom_theme.command.b.fg = palette.red
custom_theme.command.b.bg = palette.black0
custom_theme.visual.b.bg = palette.black0
custom_theme.replace.b.bg = palette.black0

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
