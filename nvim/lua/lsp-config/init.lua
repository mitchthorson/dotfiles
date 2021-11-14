vim.api.nvim_set_keymap('n', '<silent> gd', 'v:vim.lsp.buf.definition()', {noremap = true})

local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
for type, icon in pairs(signs) do
    local hl = "LspDiagnosticsSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end


require'lspconfig'.pyright.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.html.setup{}

