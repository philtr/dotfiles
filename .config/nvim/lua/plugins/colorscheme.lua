return {
  -- Select colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
  {
    "shaunsingh/nord.nvim",
    config = function()
      vim.g.nord_bold = true
      vim.g.nord_italic = true

      -- Uncomment to properly set Nord theme
      -- require("nord").set()
    end,
  },
  {
    "Everblush/nvim",
    name = "everblush",

    opts = {
      transparent_background = true,
      override = {
        TelescopeSelection = { bg = "TelescopeBorder" },
        NotifyBackground = { bg = "Background" },
      },
    },
  },
}
