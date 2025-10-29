-----------------------------------------------
-- plugins settings
-----------------------------------------------
-- load all of our third party plugins
-- using the lazy.nvim plugin
-- https://github.com/folke/lazy.nvim
-- it is simple, fast and easy to use
-----------------------------------------------

-- ensure lazy is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

---@diagnostic disable-next-line: undefined-field
if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})

end

-- Add lazy to the `runtimepath`, this allows us to `require` it.
---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- plugin configuration
local plugins = {
	require("custom.plugins.colors"),
	require("custom.plugins.tmux_navigator"),
	require("custom.plugins.zenmode"),
	require("custom.plugins.completion"),
	require("custom.plugins.copilot"),
	require("custom.plugins.codecompanion"),
	require("custom.plugins.clojure"),
	require("custom.plugins.minidiff"),
	require("custom.plugins.iron"),
	require("custom.plugins.R"),
	-- require("custom.plugins.tree"),
	require("custom.plugins.octo"),
	require("custom.plugins.oil"),
	require("custom.plugins.dadbod"),
	require("custom.plugins.gitsigns"),
	require("custom.plugins.treesitter"),
	{
		"shortcuts/no-neck-pain.nvim",
		version = "*",
	},
	{
		"neovim/nvim-lspconfig",
		config = require("lsp-config"),
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
	},
	{
		"numToStr/Comment.nvim",
		config = true,
	},
	"nvim-lua/plenary.nvim",
	{
		"nvim-telescope/telescope.nvim",
		config = require("telescope-config").init,
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
	},
	{
		"quarto-dev/quarto-nvim",
		dependencies = {
			"jmbuhr/otter.nvim",
			"neovim/nvim-lspconfig",
		},
		config = require("quarto-nvim"),
		ft = { "rmd", "rmarkdown", "quarto", "qmd" },
	},
	require("conform-config"),
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	"tpope/vim-dispatch", -- dependency for vim-jack-in
	require("neogit-config"),
	"vim-pandoc/vim-pandoc",
	"vim-pandoc/vim-pandoc-syntax",
	"windwp/nvim-ts-autotag",
	{
		"windwp/nvim-autopairs",
		init = require("nvim-autopairs-config"),
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
		},
		init = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"gopls",
					"ts_ls",
					"marksman",
					"mdx_analyzer",
					"pyright",
					"lua_ls",
					"r_language_server",
				},
			})
		end,
	},
	{
		"ThePrimeagen/harpoon",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("telescope").load_extension("harpoon")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		config = require("lualine-config"),
	},
	require("trouble-config"),
	require("obsidian-config"),
	-- require("noice-config"),
}

require("pandoc-config")
-- initialize lazy with configuration
require("lazy").setup(plugins)
