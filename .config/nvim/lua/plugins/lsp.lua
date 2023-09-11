local util = require("lspconfig.util")
return {
  "neovim/nvim-lspconfig",

  opts = {
    servers = {
      elixirls = {
        root_dir = function(fname)
          return util.root_pattern("mix.lock")(fname)
            or util.root_pattern("mix.exs", ".git")(fname)
            or vim.loop.os_homedir()
        end,
      },
    },
  },
}
