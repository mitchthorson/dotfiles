return function()
  vim.g.neoformat_enabled_python = {'black'}
	vim.g.neoformat_try_node_exe = true
	vim.g.neoformat_enabled_javascript = {'prettier'}
  vim.api.nvim_set_keymap('n', '<leader>nf', ':Neoformat<CR>', {noremap = true})
end

