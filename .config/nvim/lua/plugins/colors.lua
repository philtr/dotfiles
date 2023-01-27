local base16 = {
  "RRethy/nvim-base16",
  enabled = false,
  lazy = false,
  priority = 999,

  config = function()
    vim.cmd [[
      colorscheme base16-atelier-sulphurpool
    ]]
  end,
}

local calvera = {
  "hoppercomplex/calvera-dark.nvim",
  enabled = false,
  lazy = false,

  config = function()
    vim.g.calvera_italic_comments = true
    vim.g.calvera_italic_keywords = true
    vim.g.calvera_italic_functions = true

    require("calvera").set()
  end,
}

local lush = {
  "rktjmp/lush.nvim",
  enabled = false,
  lazy = false,
  priority = 999,
}

local nord = {
  "shaunsingh/nord.nvim",
  enabled = false,
  lazy = false,
  priority = 999,

  config = function()
    vim.g.nord_borders = true
    -- vim.g.nord_disable_background = true
    -- vim.g.nord_enable_sidebar_background = true
    vim.g.nord_italic = true
    vim.g.nord_bold = true
    vim.g.nord_uninform_diff_background = true

    require("nord").set()
  end,
}

local tokyonight = {
  "folke/tokyonight.nvim",
  enabled = true,
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

return {
  base16,
  calvera,
  lush,
  nord,
  tokyonight,
}
