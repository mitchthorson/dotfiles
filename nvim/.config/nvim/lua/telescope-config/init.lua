local M = {}

M.init = function()
	local actions = require("telescope.actions")
	local telescope = require("telescope")
	telescope.setup({
		defaults = {
			layout_config = {
				width = 0.75,
				prompt_position = "top",
				preview_cutoff = 120,
				horizontal = { mirror = false },
				vertical = { mirror = false },
			},
			find_command = {
				"rg",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
				"!**/.git/*",
			},
			prompt_prefix = "  ",
			selection_caret = " ",
			entry_prefix = "  ",
			initial_mode = "insert",
			selection_strategy = "reset",
			sorting_strategy = "ascending",
			layout_strategy = "horizontal",
			file_sorter = require("telescope.sorters").get_fuzzy_file,
			file_ignore_patterns = { "node_modules", ".git", "**/*.json", "**/*.csv" },
			generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
			path_display = {},
			winblend = 0,
			border = {},
			-- borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
			theme = "dropdown",
			borderchars = nil,
			color_devicons = false,
			use_less = true,
			set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
			file_previewer = require("telescope.previewers").vim_buffer_cat.new,
			grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
			qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
			buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
			mappings = {
				i = {
					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,
					["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
					["<esc>"] = actions.close,
					["<CR>"] = actions.select_default + actions.center,
				},
				n = {
					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,
					["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
				},
			},
		},
	})

	-- Extensions

	require("telescope").load_extension("file_browser")

	local key_map = vim.api.nvim_set_keymap
	-- Telescope shortcuts
	key_map("n", "<leader>f", "<CMD>Telescope find_files hidden=true<CR>", { noremap = true })
	key_map("n", "<leader>F", "<CMD>Telescope live_grep<CR>", { noremap = true })
	key_map("n", "<leader>r", "<CMD>Telescope lsp_references<CR>", { noremap = true })
	key_map("n", "<leader>h", "<CMD>Telescope help_tags<CR>", { noremap = true })
	key_map("n", "<leader>p", "<CMD>Telescope file_browser<CR>", { noremap = true })
	key_map("n", "<leader>w", '<CMD>lua require("telescope-config").vimwiki_pages()<CR>', { noremap = true })
end

-- custom vimwiki searcher

M.vimwiki_pages = function(opts)
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local conf = require("telescope.config").values
	--TODO: Optionally check if vimwiki index matches anything?
	local index = "0"
	if opts then
		if opts["index"] then
			index = opts["index"]
		elseif opts["i"] then
			index = opts["i"]
		end
	end
	local vimwiki_cmd = "vimwiki#base#find_files(" .. index .. ", 0)"
	pickers
		.new(opts, {
			prompt_title = "vimwiki pages",
			finder = finders.new_table({
				results = vim.api.nvim_eval(vimwiki_cmd),
			}),
			sorter = conf.generic_sorter(opts),
		})
		:find()
end

return M
