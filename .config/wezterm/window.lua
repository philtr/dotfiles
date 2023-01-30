return {
	-- disable tab bar (this is what tmux is for)
	enable_tab_bar = false,

	-- allow window to be moved and resized but do not show title bar
	window_decorations = "RESIZE",

	-- units are in pixels unless otherwise specified
	window_padding = {
		top = 30,
		right = 30,
		bottom = 30,
		left = 30,
	},
}
