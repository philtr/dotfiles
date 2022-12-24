return {
  "neovim/nvim-lspconfig",

  lazy = false,

  dependencies = {
    "mhanberg/elixir.nvim",
  },

  init = function() 
    local elixir = require("elixir")
    elixir.setup({
      settings = elixir.settings({
        dialyzerEnabled = true,
        fetchDeps = true,
        enableTestLenses = true,
        suggestSpecs = true,
      }),
    })
  end
}
