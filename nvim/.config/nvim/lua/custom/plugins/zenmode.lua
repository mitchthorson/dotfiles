return {
  {
    "folke/zen-mode.nvim",
    config = true,
    lazy = false,
    opts = {
      window = {
        options = {
          number = false,
          relativenumber = false
        }
      },
      plugins = {
        options = { laststatus = 0 },
        gitsigns = { enabled = true },
      },

    },
  },
}
