local M = {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 999,
}

function M.config()
  local tokyonight = require "tokyonight"

  tokyonight.setup {
    style = "moon",

    styles = {
      floats = "dark",
    },

    dim_inactive = false,
  }

  tokyonight.load()
end

return M
