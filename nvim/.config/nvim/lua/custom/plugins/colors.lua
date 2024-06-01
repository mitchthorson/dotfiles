return {
  {
    "rose-pine/neovim",
    lazy = true,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
  },
  {
    "Mofiqul/dracula.nvim",
    lazy = true,
  },
  {
    "shaunsingh/nord.nvim",
    lazy = true,
  },
  {
    "neanias/everforest-nvim",
    version = false,
    config = function()
      require("everforest").setup({
        -- Your config here
      })
    end,
  },
}
