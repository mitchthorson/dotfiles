-- load all of our third party plugins
require 'paq' {
	'savq/paq-nvim';
	'sbdchd/neoformat';
	'kyazdani42/nvim-web-devicons';
	{'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'};
	{'catppuccin/nvim', as = 'catppuccin'};
	'nvim-lualine/lualine.nvim';
	'akinsho/bufferline.nvim';
	'windwp/nvim-ts-autotag';
	'p00f/nvim-ts-rainbow';
	'windwp/nvim-autopairs';
	'nvim-lua/plenary.nvim';
	'nvim-telescope/telescope.nvim';
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
	-- 'kyazdani42/nvim-tree.lua';
	-- 'folke/which-key.nvim';
	-- 'hrsh7th/cmp-vsnip';
	-- 'hrsh7th/vim-vsnip';
	-- 'akinsho/toggleterm.nvim';
	-- 'EdenEast/nightfox.nvim';
}

-- load config files for plugins that need additional config
require("lsp-config")
require("nvim-treesitter-config")
require("nvim-lualine-config")
require("nvim-autopairs-config")
require("telescope-config")
require("cmp-config")
require("comment-config")
require("gitsigns-config")
-- require("nvim-tree-config")
-- require("which-key-config")
-- require("toggleterm-config")
-- require("bufferline-config")

