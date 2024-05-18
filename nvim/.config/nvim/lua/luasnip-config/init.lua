-----------------------------------------------
-- settings and snippets for the luasnip plugin
-- https://github.com/L3MON4D3/LuaSnip
-- currently surfacing via nvim-cmp
-----------------------------------------------

return function()

	local ls = require("luasnip")

	ls.config.set_config({
		history = true,
		updateevents = "TextChanged,TextChangedI",
	})

	-- this prints out a UTC timestamp to the seconds
	-- good for consistent timestamping and identifying notes
	local isosec = function()
		local fmt = "!%Y%m%d%H%M%S"
		return os.date(fmt)
	end

	-- prints out a more readable - seperated UTC timestamp to the seconds
	-- i often use this for created/modified timestamps
	local str_timestamp = function()
		local fmt = "!%Y-%m-%dT%H:%M:%S"
		return os.date(fmt)
	end

	-- prints out a more readable - seperated local timestamp to the seconds
	-- i use this for journal entry titles
	local str_today = function()
		local fmt = "%Y-%m-%d"
		return os.date(fmt)
	end

	ls.add_snippets("vimwiki", {
		ls.snippet("fm", {
			ls.text_node({ 
				string.format("---",
					str_timestamp(),
					str_timestamp()
				),
				string.format("uuid: %s", isosec()),
				string.format("created: %s", str_timestamp()),
				string.format("last-modified: %s", str_timestamp()),
				string.format("alias: " ),
				string.format("---"),
				"",
			})
		}),
		ls.snippet("isosec", {
			ls.text_node(isosec())
		}),
		ls.snippet("timestamp", {
			ls.text_node(str_timestamp())
		}),
		ls.snippet("today", {
			ls.text_node(str_today())
		}),
	})

  -- load snippets from the custom snippets directory
  for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/custom/snippets/*.lua", true)) do
    loadfile(ft_path)()
  end

	vim.keymap.set({"i", "s"}, "<C-k>", function()
		if ls.expand_or_jumpable() then
			ls.expand_or_jump()
		end
	end, { silent = true })

	vim.keymap.set({"i", "s"}, "<C-j>", function()
		if ls.jumpable(-1) then
			ls.jump(-1)
		end
	end, { silent = true })

	vim.keymap.set({"i", "s"}, "<C-l>", function()
		if ls.choice_active then
			ls.change_choice(1)
		end
	end, { silent = true })

end
