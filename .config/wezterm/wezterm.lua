local util = require("util")

local options = {}

local function config(tbl)
	util.merge(options, tbl)
end

config(require("colors"))
config(require("fonts"))
config(require("window"))

config({
	-- use physical keybinding (because Dvorak - <cmd>QWERTY)
	-- NOTE: this seems backwards to me, but this is what works 🤷
	key_map_preference = "Physical",

	-- use Core OpenGL Metal API
	prefer_egl = false,
})

return options
