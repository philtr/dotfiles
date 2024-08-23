local wezterm = require("wezterm")

return {
	font = wezterm.font({
		-- Monaspace
		-- An innovative superfamily of fonts for code
		-- https://monaspace.githubnext.com/
		family = "Monaspace Neon",

		weight = "Light",

		-- Enable fancy OpenType features for Monaspace
		-- https://monaspace.githubnext.com/#code-ligatures
		harfbuzz_features = {
			"calt", -- Contextual Alternates
			"clig", -- Contextual Ligatures
			"liga", -- Standard Ligatures
			"dlig", -- Discretionary Ligatures

			-- Stylistic Sets
			"ss01", -- Equality Symbols (==, !=, =~, etc.)
			"ss02", -- Inequality Symbols (<=, >=)
			"ss03", -- Arrows (->, =>, <!-- ~>, etc.)
			"ss04", -- XML tags (</, />, </>, <>)
			"ss05", -- [|, |], /\, \/, |>, <|
			"ss06", -- ###, +++, &&&

			-- Not yet implemented in Monaspace
			-- "ss07", "ss08", "ss09",
		},
	}),

	cell_width = 0.9,
	font_size = 16,
	line_height = 1.4,
	text_blink_rate = 500,
}
