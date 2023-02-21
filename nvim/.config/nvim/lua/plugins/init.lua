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

require('packer').startup(function(use) 
	use 'wbthomason/packer.nvim'
	use 'sbdchd/neoformat'
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
	use 'Mofiqul/dracula.nvim'
	use 'ellisonleao/gruvbox.nvim'
	use 'shaunsingh/nord.nvim'
	use 'folke/tokyonight.nvim'
	use { "catppuccin/nvim", as = "catppuccin" }
	use 'rose-pine/neovim'
	use 'windwp/nvim-ts-autotag'
	use 'p00f/nvim-ts-rainbow'
	use 'windwp/nvim-autopairs'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-telescope/telescope-file-browser.nvim'
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
	use 'onsails/lspkind-nvim'
	use 'numToStr/Comment.nvim'
	use 'lewis6991/gitsigns.nvim'
	use 'tpope/vim-fugitive'
	use 'tpope/vim-rhubarb'
	use 'jalvesaq/Nvim-R'
	use 'kyazdani42/nvim-tree.lua'
	use 'vimwiki/vimwiki'
	--currently testing out some clojure plugins
	-- 'tpope/vim-fireplace'
	use 'Olical/conjure'
	use 'tpope/vim-dispatch' -- dependency for vim-jack-in
	use 'clojure-vim/vim-jack-in'
	use 'tidalcycles/vim-tidal' -- tidal cycles music software
	use 'hkupty/iron.nvim'
	use 'tpope/vim-sleuth'
	use {'quarto-dev/quarto-nvim', requires = {
		'jmbuhr/otter.nvim',
		'neovim/nvim-lspconfig'
    }}
end)

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
require("iron")
require("neoformat")
require("quarto-nvim")

