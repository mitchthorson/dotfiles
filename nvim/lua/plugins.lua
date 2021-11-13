local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug 'hrsh7th/nvim-compe'

vim.call('plug#end')

require("plugins/nvim-tree")
require("plugins/lsp-config")
require("plugins/nvim-treesitter")
require("plugins/compe-config")
