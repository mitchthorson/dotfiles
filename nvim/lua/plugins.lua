require 'paq-nvim' {
	'neovim/nvim-lspconfig';
	'kyazdani42/nvim-web-devicons';
	'kyazdani42/nvim-tree.lua';
	{'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'};
	'hrsh7th/nvim-compe';
	'EdenEast/nightfox.nvim';
}

require("plugins/nvim-tree")
require("plugins/lsp-config")
require("plugins/nvim-treesitter")
require("plugins/compe-config")

