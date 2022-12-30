local M = {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 999,
}

function M.config()
  local tokyonight = require "tokyonight"

  tokyonight.setup {
    style = "storm",

    styles = {
      floats = "transparent",
    },

    dim_inactive = false,
  }

  tokyonight.load()
end

return M
