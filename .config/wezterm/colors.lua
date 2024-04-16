local palettes = {
	one_dark = {
		deep = {
			black = "#0c0e15",
			bg0 = "#1a212e",
			bg1 = "#21283b",
			bg2 = "#283347",
			bg3 = "#2a324a",
			bg_d = "#141b24",
			bg_blue = "#54b0fd",
			bg_yellow = "#f2cc81",
			fg = "#93a4c3",
			purple = "#c75ae8",
			green = "#8bcd5b",
			orange = "#dd9046",
			blue = "#41a7fc",
			yellow = "#efbd5d",
			cyan = "#34bfd0",
			red = "#f65866",
			grey = "#455574",
			light_grey = "#6c7d9c",
			dark_cyan = "#1b6a73",
			dark_red = "#992525",
			dark_yellow = "#8f610d",
			dark_purple = "#862aa1",
			diff_add = "#27341c",
			diff_delete = "#331c1e",
			diff_change = "#102b40",
			diff_text = "#1c4a6e",
		},
	},
}

return {
	-- color_scheme = "One Light (base16)",
	color_scheme = "OneDark (base16)",
	colors = {
		background = palettes.one_dark.deep.bg0,
		foreground = palettes.one_dark.deep.fg,
	},
}
