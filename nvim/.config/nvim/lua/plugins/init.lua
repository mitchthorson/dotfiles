-----------------------------------------------
-- plugins settings
-----------------------------------------------
-- load all of our third party plugins
-- using the paq-nvim plugin
-- https://github.com/savq/paq-nvim
-- it is simple, fast and easy to use

-- install missing plugins with PaqInstall
-- update plugins with PaqUpdate
-- remove installed plugins that are no longer used with PaqClean
-- do all of the above with PaqSync
-----------------------------------------------

require 'paq' {
	'savq/paq-nvim';
	'sbdchd/neoformat';
	{'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'};
	-- {'catppuccin/nvim', as = 'catppuccin'};
	-- 'ellisonleao/gruvbox.nvim';
	'Mofiqul/dracula.nvim';
	'windwp/nvim-ts-autotag';
	'p00f/nvim-ts-rainbow';
	'windwp/nvim-autopairs';
	'nvim-lua/plenary.nvim';
	'nvim-telescope/telescope.nvim';
	'nvim-telescope/telescope-file-browser.nvim';
	'neovim/nvim-lspconfig';
	'hrsh7th/cmp-nvim-lsp';
	'hrsh7th/cmp-buffer';
	'hrsh7th/cmp-path';
	'hrsh7th/cmp-cmdline';
	'hrsh7th/nvim-cmp';
	'L3MON4D3/LuaSnip';
	'saadparwaiz1/cmp_luasnip';
	'onsails/lspkind-nvim';
	'numToStr/Comment.nvim';
	'lewis6991/gitsigns.nvim';
	'tpope/vim-fugitive';
	'jalvesaq/Nvim-R';
	'kyazdani42/nvim-tree.lua';
	'vimwiki/vimwiki';
	--currently testing out some clojure plugins
	-- 'tpope/vim-fireplace';
	'Olical/conjure';
}

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
require("vimwiki-config")

