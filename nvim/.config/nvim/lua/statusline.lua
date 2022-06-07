-----------------------------------------------
-- Statusline
-----------------------------------------------
-- took heavy inspiration from this blog: 
-- https://nuxsh.is-a.dev/blog/custom-nvim-statusline.html
-- but in general this is a custom rolled status line just for me
-- no plugins needed
-----------------------------------------------

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
  local current_mode = vim.api.nvim_get_mode().mode
  return string.format("%s", modes[current_mode]):upper()
end

local function filepath()
  local fpath = vim.fn.fnamemodify(vim.fn.expand "%", ":~:.:h")
  if fpath == "" or fpath == "." then
      return ""
  end

  return string.format("%%<%s/", fpath)
end

local function filename()
  local fname = vim.fn.expand "%:t"
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

local function gitbranch()
	local git_info = vim.b.gitsigns_status_dict
	if not git_info or git_info.head == "" then
		return ""
	end
	return table.concat {
		"%#StatusLineAccent3# ",
		"[",
		"%#StatusLine# ",
		string.format("branch: %s", git_info.head),
		"%#StatusLineAccent3# ",
		"]",
	}
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
    "%#StatusLineAccent2# ",
	"[",
    "%#StatusLine# ",
    filepath(),
    filename(),
    "%#StatusLineAccent2# ",
	"]",
    gitbranch(),
    "%=",
    "%#StatusLineAccent4# ",
	"[",
    "%#StatusLine# ",
    filetype(),
    "%#StatusLineAccent4# ",
	"]",
    "%#StatusLineAccent5# ",
	"[",
    "%#StatusLine# ",
    lineinfo(),
    "%#StatusLineAccent5# ",
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

vim.api.nvim_exec([[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
  au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.Statusline.short()
  augroup END
]], false)

