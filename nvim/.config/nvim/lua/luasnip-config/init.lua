local ls = require("luasnip")

local isosec = function()
	local fmt = "%Y%m%d%H%M%S"
	return os.date(fmt)
end

local str_timestamp = function()
	local fmt = "%Y-%m-%dT%H:%M:%S"
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
})
