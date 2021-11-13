require 'paq-nvim' {
	'neovim/nvim-lspconfig';
	'kyazdani42/nvim-web-devicons';
	'kyazdani42/nvim-tree.lua';
	{'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'};
	'hrsh7th/nvim-compe';
	'EdenEast/nightfox.nvim';
	'nvim-lualine/lualine.nvim';
}

require("nvim-tree-config")
require("lsp-config")
require("nvim-treesitter-config")
require("compe-config")
require("nvim-lualine-config")

