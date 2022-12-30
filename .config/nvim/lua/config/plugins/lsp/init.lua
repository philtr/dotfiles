local M = {
  "VonHeikemen/lsp-zero.nvim",
  dependencies = {
    -- LSP
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    -- Completion
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-path",
    "hrsh7th/nvim-cmp",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-emoji",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp-document-symbol",

    -- Snippets
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",

    -- Inject non-LSP info into neovim
    "jose-elias-alvarez/null-ls.nvim",
    "jay-babu/mason-null-ls.nvim",
  },
}

local servers = {
  "elixirls",
  "sumneko_lua",
  "ruby_ls",
}

function M.config()
  vim.opt.signcolumn = "yes"

  require("config.plugins.lsp.mason").config()
  require("config.plugins.lsp.zero").config(servers)
  require("config.plugins.lsp.null-ls").config()
  require("config.plugins.lsp.formatting").config()
end

return M
