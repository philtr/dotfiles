return {
  "nvim-treesitter/nvim-treesitter",

  build = ":TSUpdate",
  event = "BufReadPost",

  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = {
        "eex",
        "elixir",
        "heex",
        "javascript",
        "ruby",
      },

      auto_install = true,

      highlight = { enable = true },
      indent = { enable = true },
    }
  end,
}
