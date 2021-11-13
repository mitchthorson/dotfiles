vim.api.nvim_set_keymap('n', '<silent> gd', 'v:vim.lsp.buf.definition()', {noremap = true})

require'lspconfig'.pyright.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.html.setup{}

