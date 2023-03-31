local palette = require('dracula').colors()

vim.g.nvim_tree_refresh_wait = 250

require'nvim-tree'.setup {
	open_on_setup    = false,
	view = {
		width = 30,
	},
	renderer = {
		indent_markers = {
			enable = false,
		},
		icons = {
			show = {
				git = false,
				folder = true,
				file = false,
				folder_arrow = false,
			},
			glyphs = {
					folder = {
					arrow_open = '',
					arrow_closed = '',
					default = '',
					open = '',
				}
			},
		}
	},
	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
}

local function open_nvim_tree(data)

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  -- change to the directory
  vim.cmd.cd(data.file)

  -- open the tree
  require("nvim-tree.api").tree.open()
end

-- auto call open_nvim_tree when entering a directory
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
