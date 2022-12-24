return {
  "nvim-treesitter/nvim-treesitter",

  build = ":TSUpdate",

  init = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        "ruby",
        "elixir", "heex",
        "javascript"
      },
      auto_install = true,
      highlight = {
        enable = true
      }
    })
  end,
}
