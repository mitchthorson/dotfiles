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

-- plugin configuration
local plugins = {
	'clojure-vim/vim-jack-in',
	{ "catppuccin/nvim", name = "catppuccin" },
	'ellisonleao/gruvbox.nvim',
	'folke/tokyonight.nvim',
	{'github/copilot.vim', config = function()
		-- 🤖
		vim.g.copilot_no_tab_map = true
		vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
	end},
	{'hkupty/iron.nvim', config = require("iron")},
	{
		'hrsh7th/nvim-cmp',
		init = require("nvim-cmp-config"),
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-emoji',
		}
	},
	{'jalvesaq/Nvim-R', ft = "r"},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = require("nvim-tree-config"),
	},
	'nvim-tree/nvim-tree.lua',
	{'lewis6991/gitsigns.nvim', config = require("gitsigns-config")},
	{'L3MON4D3/LuaSnip', config = require("luasnip-config")},
	'Mofiqul/dracula.nvim',
	{'neovim/nvim-lspconfig', 
		config = require("lsp-config"),
	},
	{
		'nvim-treesitter/nvim-treesitter',
		config = require("nvim-treesitter-config").init,
	},
	{'numToStr/Comment.nvim', config = function() require('Comment').setup() end},
	'nvim-lua/plenary.nvim',
	{'nvim-telescope/telescope.nvim', config = require("telescope-config").init},
	{'nvim-telescope/telescope-file-browser.nvim', dependencies = { "nvim-telescope/telescope.nvim" }},
	'onsails/lspkind-nvim',
	'p00f/nvim-ts-rainbow',
	{'quarto-dev/quarto-nvim', dependencies = {
		'jmbuhr/otter.nvim',
		'neovim/nvim-lspconfig'
	}, config = require("quarto-nvim")},
	'rose-pine/neovim',
	'saadparwaiz1/cmp_luasnip',
	{'sbdchd/neoformat', config = require("neoformat")},
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
	{'windwp/nvim-autopairs', init=require("nvim-autopairs-config")},
}

-- initialize lazy with configuration
require('lazy').setup(plugins)

