local load = require "config.load"

require "config.options"
require "config.lazy"

require("config.keymap").setup()

-- Load config/local.lua if it exists
load "config.local"
