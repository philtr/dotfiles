local act = require("wezterm").action

return {
	-- The default behavior is to treat the left Option key as the Alt modifier
	-- with no composition effects, while the right Option key performs composition
	-- (making it approximately equivalent to AltGr on other operating systems).
	-- This configuration restores the default macOS behavior.
	send_composed_key_when_left_alt_is_pressed = true,
	send_composed_key_when_right_alt_is_pressed = true,

	-- use physical keybinding (because Dvorak - <cmd>QWERTY)
	-- NOTE: this seems backwards to me, but this is what works 🤷
	key_map_preference = "Physical",
	keys = {
		-- unbind the default Ctrl-V to allow visual block in vim
		{ key = "phys:v", mods = "SHIFT|CTRL", action = act.DisableDefaultAssignment },
	},
}
