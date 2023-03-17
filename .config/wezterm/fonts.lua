local wezterm = require("wezterm")

local font = {
	SometypeMono = {
		Normal = { family = "Sometype Mono" },
		Italic = { family = "Sometype Mono", italic = true },
		Bold = { family = "Sometype Mono", weight = "Black" },
		BoldItalic = { family = "Sometype Mono", italic = true, weight = "Black" },
	},
	VictorMono = {
		Normal = { family = "VictorMono Nerd Font" },
		Italic = { family = "VictorMono Nerd Font", italic = true, weight = "DemiBold" },
		Bold = { family = "VictorMono Nerd Font" },
		BoldItalic = { family = "VictorMono Nerd Font", italic = true, weight = "Bold" },
	},
	Monaco = {
		Normal = { family = "Monaco" },
		BoldItalic = { family = "Monaco", italic = true },
		Bold = { family = "Monaco" },
		Italic = { family = "Monaco", italic = true },
	},
}

return {
	font_size = 15,
	freetype_load_target = "Light",
	line_height = 1.4,
	text_blink_rate = 500,
	font = wezterm.font_with_fallback({
		font.SometypeMono.Normal,
		font.VictorMono.Normal,
		font.Monaco.Normal,
	}),
	font_rules = {
		{
			intensity = "Bold",
			italic = true,
			font = wezterm.font_with_fallback({
				font.SometypeMono.BoldItalic,
				font.VictorMono.BoldItalic,
				font.Monaco.BoldItalic,
			}),
		},
		{
			italic = true,
			font = wezterm.font_with_fallback({
				font.SometypeMono.Italic,
				font.VictorMono.Italic,
				font.Monaco.Italic,
			}),
		},
		{
			intensity = "Bold",
			font = wezterm.font_with_fallback({
				font.SometypeMono.Bold,
				font.VictorMono.Bold,
				font.Monaco.Bold,
			}),
		},
	},
}
