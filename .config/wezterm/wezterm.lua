local wezterm = require("wezterm")

return {
	-- tab bar
	enable_tab_bar = false,

	-- use mapped keybinding (because Dvorak - <cmd>QWERTY)
	key_map_preference = "Mapped",

	color_scheme = "tokyonight-moon",
	color_schemes = {
		["tokyonight-moon"] = {
			foreground = "#c8d3f5",
			background = "#222436",
			cursor_bg = "#c8d3f5",
			cursor_border = "#c8d3f5",
			cursor_fg = "#222436",
			selection_bg = "#3654a7",
			selection_fg = "#c8d3f5",

			ansi = { "#1b1d2b", "#ff757f", "#c3e88d", "#ffc777", "#82aaff", "#c099ff", "#86e1fc", "#828bb8" },
			brights = { "#444a73", "#ff757f", "#c3e88d", "#ffc777", "#82aaff", "#c099ff", "#86e1fc", "#c8d3f5" },
		},
	},

	font = wezterm.font({ family = "Monaco" }),
	font_size = 12,
	font_antialias = "Subpixel",
	font_hinting = "Full",

	line_height = 1.4,

	text_blink_rate = 500,

	window_decorations = "RESIZE",

	window_padding = {
		left = "2cell",
		right = "2cell",
		top = "1cell",
		bottom = "0.3cell",
	},
}
