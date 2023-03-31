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
	'clojure-vim/vim-jack-in',
	{ "catppuccin/nvim", name = "catppuccin" },
	'ellisonleao/gruvbox.nvim',
	'folke/tokyonight.nvim',
	'github/copilot.vim', -- 🤖
	'hkupty/iron.nvim',
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',

		}
	},
	'jalvesaq/Nvim-R',
	'kyazdani42/nvim-tree.lua',
	'lewis6991/gitsigns.nvim',
	'L3MON4D3/LuaSnip',
	'Mofiqul/dracula.nvim',
	'neovim/nvim-lspconfig',
	{
		'nvim-treesitter/nvim-treesitter',
	},
	'numToStr/Comment.nvim',
	'nvim-lua/plenary.nvim',
	'nvim-telescope/telescope.nvim',
	'nvim-telescope/telescope-file-browser.nvim',
	'onsails/lspkind-nvim',
	'p00f/nvim-ts-rainbow',
	{'quarto-dev/quarto-nvim', dependencies = {
		'jmbuhr/otter.nvim',
		'neovim/nvim-lspconfig'
	}},
	'rose-pine/neovim',
	'saadparwaiz1/cmp_luasnip',
	'sbdchd/neoformat',
	'shaunsingh/nord.nvim',
	--currently testing out some clojure plugins
	-- 'Olical/conjure',
	-- 'tidalcycles/vim-tidal', -- tidal cycles music software
	-- 'tpope/vim-fireplace'
	'tpope/vim-fugitive',
	'tpope/vim-rhubarb',
	'tpope/vim-dispatch', -- dependency for vim-jack-in
	'tpope/vim-sleuth',
	{'vimwiki/vimwiki', init=require("vimwiki-config").init},
	'windwp/nvim-ts-autotag',
	'windwp/nvim-autopairs',
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


-----------------------------------------------
-- copilot settings (for now)

vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
