
require("which-key").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }

local wk = require("which-key")
local mappings = {
	q = ":q"
}
local opts = {prefix = "<leader>"}
wk.register(mappings, opts)
