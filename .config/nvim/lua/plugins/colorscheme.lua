return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "mhartington/oceanic-next" },
  { "jsit/disco.vim" },
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
    "letorbi/vim-colors-modern-borland",
    config = function()
      vim.g.BorlandStyle = "classic"
    end,
  },

  -- Select colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "everblush",
    },
  },
}
