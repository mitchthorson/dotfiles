local map = vim.api.nvim_set_keymap

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "hl" })
end

-- lsp specific keybindings to setup on LSP attach
local function handle_attach(client)
	map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true})
	map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})
	map('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', {noremap = true})
	map('n', 'gi', '<cmd>lua vim.lsp.buf.type_implementation()<CR>', {noremap = true})
	map('n', '<leader>dj', '<cmd>lua vim.diagnostic.goto_next()<CR>', {noremap = true})
	map('n', '<leader>dk', '<cmd>lua vim.diagnostic.goto_prev()<CR>', {noremap = true})
	map('n', '<leader>dl', '<cmd>Telescope diagnostics<CR>', {noremap = true})
	map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', {noremap = true})
	map('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>', {noremap = true})
end

-- capabilities to use with each language server
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require'lspconfig'.html.setup {
	capabilities = capabilities,
	on_attach = handle_attach
}
require'lspconfig'.tsserver.setup{
	capabilities = capabilities,
	on_attach = handle_attach
}
require'lspconfig'.pyright.setup{
	capabilities = capabilities,
	on_attach = handle_attach
}
require'lspconfig'.cssls.setup{
	capabilities = capabilities,
	on_attach = handle_attach
}
require'lspconfig'.svelte.setup{
	capabilities = capabilities,
	on_attach = handle_attach
}
require'lspconfig'.r_language_server.setup{
	capabilities = capabilities,
	on_attach = handle_attach
}
require'lspconfig'.gopls.setup{
	capabilities = capabilities,
	on_attach = handle_attach
}
require'lspconfig'.rust_analyzer.setup{
	capabilities = capabilities,
	on_attach = handle_attach
}

require'lspconfig'.astro.setup{
	capabilities = capabilities,
	on_attach = handle_attach
}
-- setup lua language server

require'lspconfig'.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

