local tokyonight = {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 999,

  config = function()
    local tokyonight = require "tokyonight"

    tokyonight.setup {
      style = "moon",

      styles = {
        floats = "dark",
      },

      dim_inactive = false,

      on_highlights = function(hl, c)
        hl.Floaterm = { bg = c.bg_dark }
        hl.FloatermBorder = { bg = c.bg_dark, fg = c.cyan }
      end,
    }

    tokyonight.load()
  end,
}

local lush = {
  "rktjmp/lush.nvim",
  lazy = false,
  priority = 999,
}

return {
  tokyonight,
  lush,
}
