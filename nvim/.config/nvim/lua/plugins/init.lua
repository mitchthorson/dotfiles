require 'paq' {
	'savq/paq-nvim';
	'kyazdani42/nvim-web-devicons';
	'kyazdani42/nvim-tree.lua';
	{'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'};
	'EdenEast/nightfox.nvim';
	'nvim-lualine/lualine.nvim';
	'akinsho/bufferline.nvim';
	'windwp/nvim-ts-autotag';
	'p00f/nvim-ts-rainbow';
	'windwp/nvim-autopairs';
	'folke/which-key.nvim';
	'nvim-lua/plenary.nvim';
	'nvim-telescope/telescope.nvim';
	'neovim/nvim-lspconfig';
	'hrsh7th/cmp-nvim-lsp';
	'hrsh7th/cmp-buffer';
	'hrsh7th/cmp-path';
	'hrsh7th/cmp-cmdline';
	'hrsh7th/nvim-cmp';
	'hrsh7th/cmp-vsnip';
	'hrsh7th/vim-vsnip';
	'onsails/lspkind-nvim';
	'numToStr/Comment.nvim';
	'akinsho/toggleterm.nvim';
	'lewis6991/gitsigns.nvim';
}

-- require("nvim-tree-config")
require("lsp-config")
require("nvim-treesitter-config")
require("nvim-lualine-config")
-- require("bufferline-config")
require("nvim-autopairs-config")
require("which-key-config")
require("telescope-config")
require("cmp-config")
require("comment-config")
require("toggleterm-config")
require("gitsigns-config")

