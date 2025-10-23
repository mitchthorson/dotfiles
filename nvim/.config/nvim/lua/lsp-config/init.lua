function init()

	local map = vim.api.nvim_set_keymap
	local nvim_lsp = vim.lsp

	local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

	for type, icon in pairs(signs) do
	  local hl = "DiagnosticSign" .. type
	  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "hl" })
	end

	-- lsp specific keybindings to setup on LSP attach
	local function handle_attach(client)
		map('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true})
		map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})
		map('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', {noremap = true})
		map('n', 'gi', '<cmd>lua vim.lsp.buf.type_implementation()<CR>', {noremap = true})
		map('n', 'gr', '<cmd>lua vim.lsp.buf.rename()<CR>', {noremap = true})
		map('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', {noremap = true})
		map('n', '<leader>dj', '<cmd>lua vim.diagnostic.goto_next()<CR>', {noremap = true})
		map('n', '<leader>dk', '<cmd>lua vim.diagnostic.goto_prev()<CR>', {noremap = true})
		map('n', '<leader>dl', '<cmd>Telescope diagnostics<CR>', {noremap = true})
		map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', {noremap = true})
		map('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>', {noremap = true})
	end

	-- capabilities to use with each language server
	local capabilities = require('cmp_nvim_lsp').default_capabilities()

	nvim_lsp.config("html", {
		capabilities = capabilities,
		on_attach = handle_attach
	})
  nvim_lsp.enable("html")
	nvim_lsp.config("ts_ls",{
		capabilities = capabilities,
		on_attach = handle_attach,
		root_dir = require'lspconfig.util'.root_pattern("package.json"),
  })
  nvim_lsp.enable("ts_ls")
  nvim_lsp.config("tailwindcss", {
		capabilities = capabilities,
		on_attach = handle_attach,
  })
  nvim_lsp.enable("tailwindcss")
	nvim_lsp.config("vtsls", {
		capabilities = capabilities,
		on_attach = handle_attach,
	})
  nvim_lsp.enable("vtsls")
	nvim_lsp.config("pyright", {
		capabilities = capabilities,
		on_attach = handle_attach
	})
  nvim_lsp.enable("pyright")
	nvim_lsp.config("svelte", {
		capabilities = capabilities,
		on_attach = handle_attach
	})
  nvim_lsp.enable("svelte")
	nvim_lsp.config("r_language_server", {
		capabilities = capabilities,
		on_attach = handle_attach
	})
  nvim_lsp.enable("r_language_server")
	nvim_lsp.config("gopls", {
		capabilities = capabilities,
		on_attach = handle_attach
	})
  nvim_lsp.enable("gopls")
	nvim_lsp.config("rust_analyzer", {
		capabilities = capabilities,
		on_attach = handle_attach
	})
  nvim_lsp.enable("rust_analyzer")

	nvim_lsp.config("astro", {
		capabilities = capabilities,
		on_attach = handle_attach
	})
  nvim_lsp.enable("astro")
	nvim_lsp.config("yamlls", {
		capabilities = capabilities,
		on_attach = handle_attach,
		settings = {
			yaml = {
				schemas = {
					["https://json.schemastore.org/circleciconfig.json"] = "/.circleci/*",
					["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*"
				},
			},
		}
	})
  nvim_lsp.enable("yamlls")
	-- setup lua language server

	nvim_lsp.config("lua_ls", {
		capabilities = capabilities,
		on_attach = handle_attach,
	  settings = {
	    Lua = {
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
	})
  nvim_lsp.enable("lua_ls")

end

return init
