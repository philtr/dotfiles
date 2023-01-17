local M = {}

function M.config(ensure_installed)
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

  lsp.ensure_installed(ensure_installed or {})

  require("plugins.lsp.elixirls").setup(lsp)
  require("plugins.lsp.ruby_ls").setup(lsp)
  require("plugins.lsp.sumneko_lua").setup(lsp)

  require("plugins.lsp.completion").config(lsp)

  lsp.setup()

  require("plugins.lsp.completion").cmdline()
end

return M
