-----------------------------------------------
-- plugins settings
-----------------------------------------------
-- load all of our third party plugins
-- using the lazy.nvim plugin
-- https://github.com/folke/lazy.nvim
-- it is simple, fast and easy to use

-- install missing plugins with PaqInstall
-- update plugins with PaqUpdate
-- remove installed plugins that are no longer used with PaqClean
-- do all of the above with PaqSync
-----------------------------------------------

-- ensure lazy is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	'sbdchd/neoformat',
	{
		'nvim-treesitter/nvim-treesitter',
	},
	'Mofiqul/dracula.nvim',
	'ellisonleao/gruvbox.nvim',
	'shaunsingh/nord.nvim',
	'folke/tokyonight.nvim',
	{ "catppuccin/nvim", name = "catppuccin" },
	'rose-pine/neovim',
	'windwp/nvim-ts-autotag',
	'p00f/nvim-ts-rainbow',
	'windwp/nvim-autopairs',
	'nvim-lua/plenary.nvim',
	'nvim-telescope/telescope.nvim',
	'nvim-telescope/telescope-file-browser.nvim',
	'neovim/nvim-lspconfig',
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',

		}
	},
	'L3MON4D3/LuaSnip',
	'saadparwaiz1/cmp_luasnip',
	'onsails/lspkind-nvim',
	'numToStr/Comment.nvim',
	'lewis6991/gitsigns.nvim',
	'tpope/vim-fugitive',
	'tpope/vim-rhubarb',
	'jalvesaq/Nvim-R',
	'kyazdani42/nvim-tree.lua',
	{'vimwiki/vimwiki', init=require("vimwiki-config").init},
	--currently testing out some clojure plugins
	-- 'tpope/vim-fireplace'
	'Olical/conjure',
	'tpope/vim-dispatch', -- dependency for vim-jack-in
	'clojure-vim/vim-jack-in',
	'tidalcycles/vim-tidal', -- tidal cycles music software
	'hkupty/iron.nvim',
	'tpope/vim-sleuth',
	{'quarto-dev/quarto-nvim', dependencies = {
		'jmbuhr/otter.nvim',
		'neovim/nvim-lspconfig'
	}},
	'github/copilot.vim',
}

require('lazy').setup(plugins)

-----------------------------------------------
-- load config files for plugins that need additional config

require("lsp-config")
require("nvim-treesitter-config")
require("nvim-autopairs-config")
require("cmp-config")
require("comment-config")
require("gitsigns-config")
require("nvim-tree-config")
require("luasnip-config")
require("telescope-config")
-- require("vimwiki-config")
require("iron")
require("neoformat")
require("quarto-nvim")

