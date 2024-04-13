-----------------------------------------------
-- plugins settings
-----------------------------------------------
-- load all of our third party plugins
-- using the lazy.nvim plugin
-- https://github.com/folke/lazy.nvim
-- it is simple, fast and easy to use
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
  "clojure-vim/vim-jack-in",
  "christoomey/vim-tmux-navigator",
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
  },
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    -- config = require("neogen-config"),
    config = true,
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
    "folke/zen-mode.nvim",
    config = true,
    lazy = false,
    opts = {
      backdrop = 0.5,
      width = 0.5,
      plugins = {
        options = { laststatus = 0 },
        gitsigns = { enabled = true },
      },

    },
  },
  -- {
  --   "zbirenbaum/copilot.lua",
  --   config = function()
  --     require("copilot").setup({
  --       suggestion = { enabled = false },
  --       panel = { enabled = false },
  --     })
  --   end,
  -- },
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   config = function()
  --     require("copilot_cmp").setup()
  --   end,
  -- },
  -- {
  -- 	'github/copilot.vim', -- 🤖
  -- 	config = function()
  --      vim.g.copilot_no_tab_map = true
  --      vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
  -- 	end,
  -- },
  {
    "hkupty/iron.nvim",
    config = require("iron"),
  },
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-emoji",
  "hrsh7th/cmp-nvim-lua",
  {
    "hrsh7th/nvim-cmp",
    init = require("nvim-cmp-config"),
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-nvim-lua",
    },
  },
  -- {
  -- 	'jalvesaq/Nvim-R',
  -- 	ft = {"r", "rmd", "rmarkdown", "quarto", "qmd"},
  -- },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = require("nvim-tree-config"),
  },
  {
    "lewis6991/gitsigns.nvim",
    config = require("gitsigns-config"),
  },
  {
    "L3MON4D3/LuaSnip",
    config = require("luasnip-config"),
  },
  {
    "Mofiqul/dracula.nvim",
    lazy = true,
  },
  {
    "neovim/nvim-lspconfig",
    config = require("lsp-config"),
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = require("nvim-treesitter-config"),
  },
  {
    "numToStr/Comment.nvim",
    config = true,
  },
  "nvim-lua/plenary.nvim",
  {
    "nvim-telescope/telescope.nvim",
    config = require("telescope-config").init,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
  },
  "onsails/lspkind-nvim",
  -- nvim-ts-rainbow is no longer maintained and causing errors
  -- 'p00f/nvim-ts-rainbow',
  {
    "quarto-dev/quarto-nvim",
    dependencies = {
      "jmbuhr/otter.nvim",
      "neovim/nvim-lspconfig",
    },
    config = require("quarto-nvim"),
    ft = { "rmd", "rmarkdown", "quarto", "qmd" },
  },
  {
    "rose-pine/neovim",
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
  "saadparwaiz1/cmp_luasnip",
  -- {
  --    'sbdchd/neoformat',
  --    config = require("neoformat"),
  --  },
  {
    "stevearc/conform.nvim",
    config = require("conform-config"),
  },
  "shaunsingh/nord.nvim",
  --currently testing out some clojure plugins
  -- 'Olical/conjure',
  -- 'tidalcycles/vim-tidal', -- tidal cycles music software
  -- 'tpope/vim-fireplace'
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  "tpope/vim-dispatch", -- dependency for vim-jack-in
  -- 'tpope/vim-sleuth',
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",  -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed, not both.
      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua",              -- optional
    },
    config = function()
      require('neogit').setup({
        integrations = {
          diffview = true,
          telescope = true,
        }
      })
      require("neogit-config")
    end
  },
  -- {
  --   "vimwiki/vimwiki",
  --   init = require("vimwiki-config"),
  -- },
  {
    "vim-pandoc/vim-pandoc",
  },
  {
    "vim-pandoc/vim-pandoc-syntax",
  },
  "windwp/nvim-ts-autotag",
  {
    "windwp/nvim-autopairs",
    init = require("nvim-autopairs-config"),
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    init = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "gopls",
          "tsserver",
          "marksman",
          "mdx_analyzer",
          "pyright",
          "lua_ls",
          "r_language_server",
        },
      })
    end,
  },
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("telescope").load_extension("harpoon")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    config = require("lualine-config"),
  },
  require("trouble-config"),
  require("obsidian-config"),
  -- require("noice-config"),
}

require("pandoc-config")
-- initialize lazy with configuration
require("lazy").setup(plugins)
