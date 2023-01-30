local wezterm = require("wezterm")

return {
	font = wezterm.font({ family = "Monaco" }),

	font_rules = {
		{
			italic = true,
			font = wezterm.font({
				family = "VictorMono Nerd Font",
				italic = true,
				weight = "DemiBold",
			}),
		},
	},

	font_size = 12,
	font_antialias = "Grayscale",
	font_hinting = "Full",

	line_height = 1.4,

	text_blink_rate = 500,
}
