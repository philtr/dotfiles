local util = require("util")

local options = {}

local function config(tbl)
	util.merge(options, tbl)
end

config(require("colors"))
config(require("fonts"))
config(require("window"))
config(require("keys"))

return options
