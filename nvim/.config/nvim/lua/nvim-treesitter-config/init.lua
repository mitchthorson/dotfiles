return function()
    require("nvim-treesitter.configs").setup {
	    ensure_installed = {"html", "javascript", "typescript", "css", "lua", "svelte", "python", "bash", "json", "go", "gomod", "yaml", "make", "markdown", "r", "astro",},
	    highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
	    },
	    autotag = {
				enable = true,
	    },
	    rainbow = {
				enable= true,
				extended_mode = false,
	    },
    }

    -- vim.treesitter.language.register("markdown", "mdx")

    vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
			vim.lsp.diagnostic.on_publish_diagnostics,
			{
				underline = true,
				virtual_text = {
					spacing = 5,
					severity_limit = 'Warning',
				},
				update_in_insert = true,
			}
    )
end

