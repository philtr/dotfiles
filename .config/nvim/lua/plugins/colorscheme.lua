return {
  -- Select colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "storm",
      transparent = true,
      terminal_colors = true,
      -- day_brightness = 0.7,
      on_colors = function(colors) -- change some colors
        colors.bg = "#ffffff"
      end,
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
  {
    "navarasu/onedark.nvim",
    opts = {
      style = "light",
      lualine = { transparent = true },
      code_style = {
        keywords = "italic",
        strings = "italic",
      },
      diagnostics = {
        darker = false,
      },
    },
  },
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      contrast = "hard",
    },
  },
}
