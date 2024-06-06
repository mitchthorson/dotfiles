return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-emoji",
		"hrsh7th/cmp-nvim-lua",
    {
      "L3MON4D3/LuaSnip",
    },
    "onsails/lspkind-nvim",
    "saadparwaiz1/cmp_luasnip",
	},
	init = function()
    require "custom.completion"
  end
}
