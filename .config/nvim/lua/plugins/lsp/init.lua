local M = {
  "VonHeikemen/lsp-zero.nvim",

  event = "BufReadPost",

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

    -- Neovim setup with full signature help, docs and completion for the nvim lua API.
    { "folke/neodev.nvim", config = true },
  },
}

local servers = {
  "elixirls",
  "sumneko_lua",
  "ruby_ls",
}

function M.config()
  vim.opt.signcolumn = "yes"

  require("plugins.lsp.mason").config()
  require("plugins.lsp.zero").config(servers)
  require("plugins.lsp.null-ls").config()
  require("plugins.lsp.formatting").config()
end

return M
