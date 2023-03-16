local act = require("wezterm").action

return {
	-- use physical keybinding (because Dvorak - <cmd>QWERTY)
	-- NOTE: this seems backwards to me, but this is what works 🤷
	key_map_preference = "Physical",
	keys = {
		-- unbind the default Ctrl-V to allow visual block in vim
		{ key = "phys:v", mods = "SHIFT|CTRL", action = act.DisableDefaultAssignment },
	},
}
