local M = {}

function M.config()
  local act = require("null-ls.builtins").code_actions
  local cmp = require("null-ls.builtins").completion
  local dag = require("null-ls.builtins").diagnostics
  local fmt = require("null-ls.builtins").formatting

  require("null-ls").setup {
    -- uncomment the followinng lines to enable debug output
    -- debug = true,
    -- log_level = "trace",

    default_timeout = 20000,

    sources = {
      -- Completions
      cmp.luasnip,

      -- General
      dag.cspell.with { filetypes = { "markdown" } },
      act.cspell,

      -- Elixir
      dag.credo,
      fmt.mix,

      -- Ruby
      dag.standardrb,
      fmt.standardrb,
      dag.erb_lint,
      fmt.erb_lint,

      -- Shell
      dag.zsh,
      fmt.beautysh,

      -- Lua
      fmt.stylua,
    },
  }

  require("mason-null-ls").setup {
    ensure_installed = {},
    automatic_setup = true,
    automatic_installation = true,
  }
end

return M
