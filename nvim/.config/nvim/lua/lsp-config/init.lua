local map = vim.api.nvim_set_keymap

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "hl" })
end

-- lsp specific keybindings to setup on LSP attach
local function set_lsp_keybindings()
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
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require'lspconfig'.html.setup {
	capabilities = capabilities,
	on_attach = set_lsp_keybindings
}
require'lspconfig'.tsserver.setup{
	capabilities = capabilities,
	on_attach = set_lsp_keybindings
}
require'lspconfig'.pyright.setup{
	capabilities = capabilities,
	on_attach = set_lsp_keybindings
}
require'lspconfig'.cssls.setup{
	capabilities = capabilities,
	on_attach = set_lsp_keybindings
}
require'lspconfig'.svelte.setup{
	capabilities = capabilities,
	on_attach = set_lsp_keybindings
}
require'lspconfig'.r_language_server.setup{
	capabilities = capabilities,
	on_attach = set_lsp_keybindings
}
require'lspconfig'.gopls.setup{
	capabilities = capabilities,
	on_attach = set_lsp_keybindings
}

-- setup lua language server

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = (os.getenv("LUA_LSP_PATH") or "/home/mitchthorson/lua-language-server")
local sumneko_binary = sumneko_root_path.."/bin/lua-language-server"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup {
	cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
	capabilities = capabilities,
	on_attach = set_lsp_keybindings,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
				-- Setup your lua path
				path = runtime_path,
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

