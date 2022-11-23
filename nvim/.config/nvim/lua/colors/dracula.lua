local palette = require('dracula.palette')

vim.cmd(string.format("hi LineNr guifg=%s", palette.white))
vim.cmd(string.format("hi CursorLine guibg=%s", palette.selection))
vim.cmd(string.format("hi CursorLineNr guifg=%s", palette.purple))
vim.cmd(string.format("hi StatusLineAccent1 gui=NONE guibg=NONE ctermbg=NONE guifg=%s", palette.purple))
vim.cmd(string.format("hi StatusLineAccent2 gui=NONE guibg=NONE ctermbg=NONE guifg=%s", palette.cyan))
vim.cmd(string.format("hi StatusLineAccent3 gui=NONE guibg=NONE ctermbg=NONE guifg=%s", palette.green))
vim.cmd(string.format("hi StatusLineAccent4 gui=NONE guibg=NONE ctermbg=NONE guifg=%s", palette.yellow))
vim.cmd(string.format("hi StatusLineAccent5 gui=NONE guibg=NONE ctermbg=NONE guifg=%s", palette.pink))
vim.cmd(string.format("hi StatusLineAccent6 gui=NONE guibg=NONE ctermbg=NONE guifg=%s", palette.orange))
vim.cmd(string.format("hi GitSignsCurrentLineBlame guifg=%s", palette.pink))

--[[
vim.cmd(string.format("hi Comment gui=italic guifg=%s", palette.white)) ]]
vim.cmd(string.format("hi TSProperty guifg=%s", palette.pink))
vim.cmd(string.format("hi TSVariable guifg=%s", palette.pink))

-----------------------------------------------
-- custom nvimtree colors
vim.cmd(string.format("hi NvimTreeFolderIcon guifg=%s", palette.yellow))
vim.cmd(string.format("hi NvimTreeFolderName guifg=%s", palette.green))
vim.cmd(string.format("hi NvimTreeOpenedFolderName guifg=%s", palette.purple))
vim.cmd(string.format("hi NvimTreeRootFolder guifg=%s", palette.purple))
vim.cmd(string.format("hi NvimTreeCursorLine guibg=%s guifg=%s", palette.green, palette.black))

