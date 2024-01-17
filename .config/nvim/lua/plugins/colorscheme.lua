return {
  {
    "shaunsingh/nord.nvim",
    config = function()
      vim.g.nord_bold = true
      vim.g.nord_italic = true

      require("nord").set()
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
  -- Select colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nord",
    },
  },
}
