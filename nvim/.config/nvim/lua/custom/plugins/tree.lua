return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		config = function()
			require("neo-tree").setup({
				filesystem = {
					filtered_items = {
						hide_dotfiles = false,
					},
				},
				default_component_configs = {
					icon = {
						folder_closed = "",
						folder_open = "",
						folder_empty = "󰜌",
						-- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
						-- then these will never be used.
						default = "*",
						highlight = "NeoTreeFileIcon",
					},
				},
			})

			vim.api.nvim_set_keymap("n", "<C-n>", ":Neotree toggle<CR>", { noremap = true, silent = true })
		end,
	},
	-- {
	-- 	"nvim-tree/nvim-tree.lua",
	-- 	version = "*",
	-- 	dependencies = {
	-- 		"nvim-tree/nvim-web-devicons",
	-- 	},
	-- 	config = function()
	-- 		vim.g.nvim_tree_refresh_wait = 250
	--
	-- 		require("nvim-tree").setup({
	-- 			view = {
	-- 				width = 30,
	-- 			},
	-- 			renderer = {
	-- 				indent_markers = {
	-- 					enable = false,
	-- 				},
	-- 				icons = {
	-- 					show = {
	-- 						git = false,
	-- 						folder = true,
	-- 						file = false,
	-- 						folder_arrow = false,
	-- 					},
	-- 					glyphs = {
	-- 						folder = {
	-- 							arrow_open = "",
	-- 							arrow_closed = "",
	-- 							default = "",
	-- 							open = "",
	-- 						},
	-- 					},
	-- 				},
	-- 			},
	-- 			actions = {
	-- 				open_file = {
	-- 					quit_on_open = true,
	-- 				},
	-- 			},
	-- 		})
	--
	-- 		-- thanks to https://github.com/nvim-tree/nvim-tree.lua/wiki/Open-At-Startup
	-- 		local function open_nvim_tree(data)
	-- 			-- buffer is a directory
	-- 			local directory = vim.fn.isdirectory(data.file) == 1
	--
	-- 			if not directory then
	-- 				return
	-- 			end
	--
	-- 			-- change to the directory
	-- 			vim.cmd.cd(data.file)
	--
	-- 			-- open the tree
	-- 			require("nvim-tree.api").tree.open()
	-- 		end
	--
	-- 		-- auto call open_nvim_tree when entering a directory
	-- 		vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
	-- 		vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
	-- 	end,
	-- },
}
