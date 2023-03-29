local map = vim.api.nvim_set_keymap
local nvim_lsp = require'lspconfig'

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

nvim_lsp.html.setup {
	capabilities = capabilities,
	on_attach = handle_attach
}
nvim_lsp.denols.setup{
	on_attach = handle_attach,
	root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
}

nvim_lsp.tsserver.setup{
	capabilities = capabilities,
	on_attach = handle_attach,
	root_dir = nvim_lsp.util.root_pattern("package.json"),
	single_file_support = false
}
nvim_lsp.pyright.setup{
	capabilities = capabilities,
	on_attach = handle_attach
}
nvim_lsp.cssls.setup{
	capabilities = capabilities,
	on_attach = handle_attach
}
nvim_lsp.svelte.setup{
	capabilities = capabilities,
	on_attach = handle_attach
}
nvim_lsp.r_language_server.setup{
	capabilities = capabilities,
	on_attach = handle_attach
}
nvim_lsp.gopls.setup{
	capabilities = capabilities,
	on_attach = handle_attach
}
nvim_lsp.rust_analyzer.setup{
	capabilities = capabilities,
	on_attach = handle_attach
}

nvim_lsp.astro.setup{
	capabilities = capabilities,
	on_attach = handle_attach
}
-- setup lua language server

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = (os.getenv("LUA_LSP_PATH") or os.getenv("HOME").."/lua-language-server")
local sumneko_binary = sumneko_root_path.."/bin/lua-language-server"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

nvim_lsp.sumneko_lua.setup {
	cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
	capabilities = capabilities,
	on_attach = handle_attach,
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

