local M = {}

function M.config(servers)
  servers = servers or {}

  local lsp = require "lsp-zero"

  -- Use the "recommended" preset:
  --  * Setup every language server installed with mason.nvim at startup.
  --  * Suggest to install a language server when you encounter a new filetype.
  --  * Setup nvim-cmp with some default completion sources, this includes
  --    support for LSP based completion.
  --  * Setup some default keybindings for nvim-cmp.
  --  * Show diagnostic info with "nice" icons.
  --  * Diagnostic messages are shown in a floating window.
  --  * Setup some keybindings related to LSP actions, things like go to
  --    definition or rename variable.
  lsp.preset "recommended"

  lsp.ensure_installed(servers)

  require("config.plugins.lsp.elixirls").setup(lsp)
  require("config.plugins.lsp.ruby_ls").setup(lsp)
  require("config.plugins.lsp.sumneko_lua").setup(lsp)

  lsp.nvim_workspace()

  require("config.plugins.lsp.completion").config(lsp)

  lsp.setup()
end

return M
