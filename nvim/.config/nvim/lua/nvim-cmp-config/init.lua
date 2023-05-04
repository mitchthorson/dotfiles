 -- Setup and configure nvim-cmp plugin
 -- https://github.com/hrsh7th/nvim-cmpcmp
 -- this provides easy to use completions from sources like lsp and luasnip
return function()
	vim.g.completeopt="menu,menuone,noselect,noinsert"

	local cmp = require'cmp'

	local has_words_before = function()
	  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	end

	local feedkey = function(key, mode)
	  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
	end

	local lspkind = require('lspkind')
	local luasnip = require('luasnip')

	cmp.setup({
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body) -- For `luasnip` users.
			end,
		},
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},
		mapping = {
			['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
			['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
			['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
			['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
			['<C-e>'] = cmp.mapping({
				i = cmp.mapping.abort(),
				c = cmp.mapping.close(),
			}),
			['<CR>'] = cmp.mapping.confirm({ select = true }),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				elseif has_words_before() then
					cmp.complete()
				else
					fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
				end
			end, { "i", "s" }),

			["<S-Tab>"] = cmp.mapping(function()
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				end
			end, { "i", "s" }),
		},
		sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'otter' },
				{ name = 'luasnip' }, -- For luasnip users.
				{ name = 'emoji' },
				{ name = 'nvim_lua' }
			},
			{
				{ name = 'path' },
				{ name = 'buffer' },
		}),
		formatting = {
	    format = lspkind.cmp_format({with_text = true, maxwidth = 50})
	  },
	})


end
