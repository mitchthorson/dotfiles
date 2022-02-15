-----------------------------------------------------------
-- Statusline
-----------------------------------------------------------

-- heavy inspiration from this blog: https://nuxsh.is-a.dev/blog/custom-nvim-statusline.html

local fn = vim.fn
local api = vim.api
local cmd = vim.cmd

local modes = {
  ["n"] = "NORMAL",
  ["no"] = "NORMAL",
  ["v"] = "VISUAL",
  ["V"] = "VISUAL LINE",
  [""] = "VISUAL BLOCK",
  ["s"] = "SELECT",
  ["S"] = "SELECT LINE",
  [""] = "SELECT BLOCK",
  ["i"] = "INSERT",
  ["ic"] = "INSERT",
  ["R"] = "REPLACE",
  ["Rv"] = "VISUAL REPLACE",
  ["c"] = "COMMAND",
  ["cv"] = "VIM EX",
  ["ce"] = "EX",
  ["r"] = "PROMPT",
  ["rm"] = "MOAR",
  ["r?"] = "CONFIRM",
  ["!"] = "SHELL",
  ["t"] = "TERMINAL",
}

local function mode()
  local current_mode = api.nvim_get_mode().mode
  return string.format("%s", modes[current_mode]):upper()
end

local function filepath()
  local fpath = fn.fnamemodify(fn.expand "%", ":~:.:h")
  if fpath == "" or fpath == "." then
      return ""
  end

  return string.format("%%<%s/", fpath)
end

local function filename()
  local fname = fn.expand "%:t"
  if fname == "" then
      return ""
  end
  return fname .. ""
end

local function filetype()
  return string.format("%s", vim.bo.filetype)
end

local function lineinfo()
  if vim.bo.filetype == "alpha" then
    return ""
  end
  return "%P %l:%c"
end

Statusline = {}

Statusline.active = function()
  return table.concat {
    "%#StatusLineAccent1# ",
	"[",
    "%#StatusLine# ",
    mode(),
    "%#StatusLineAccent1# ",
	"]",
    "%#StatusLine# ",
    "%#StatusLineAccent2# ",
	"[",
    "%#StatusLine# ",
    filepath(),
    filename(),
    "%#StatusLineAccent2# ",
	"]",
    "%#StatusLine# ",
    "%=",
    "%#StatusLineAccent3# ",
	"[",
    "%#StatusLine# ",
    filetype(),
    "%#StatusLineAccent3# ",
	"]",
    "%#StatusLine# ",
    "%#StatusLineAccent4# ",
	"[",
    "%#StatusLine# ",
    lineinfo(),
    "%#StatusLineAccent4# ",
	"]",
    "%#StatusLine# ",
  }
end

function Statusline.inactive()
  return "%#StatusLine#[%F]"
end

function Statusline.short()
  return "%#StatusLine#   NvimTree"
end

api.nvim_exec([[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
  au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.Statusline.short()
  augroup END
]], false)

