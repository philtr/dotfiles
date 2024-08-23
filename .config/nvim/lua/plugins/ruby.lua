return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        rubocop = {
          mason = false,
          autostart = false,
        },
        -- ruby_lsp will be automatically installed with mason and loaded with lspconfig
        ruby_lsp = {
          mason = false,
          cmd = { "/Users/philtr/.asdf/shims/ruby-lsp" },
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        eruby = {
          "htmlbeautifier",
          "erb_lint",
        },
        html = { "prettier" },
      },
      formatters = {
        erb_lint = {
          command = "bundle",
          args = { "exec", "erblint", "--format", "quiet", "--autocorrect", "--stdin", "$FILENAME" },
        },
        htmlbeautifier = {
          command = "htmlbeautifier",
          args = { "-b", "1" },
        },
        rubocop = { command = "bundle exec rubocop" },
      },
    },
  },
}
