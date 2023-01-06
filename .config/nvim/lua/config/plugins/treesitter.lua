local M = {
  "nvim-treesitter/nvim-treesitter",

  build = ":TSUpdate",
  event = "BufReadPost",

  dependencies = {
    -- display nested context at top of window
    { "nvim-treesitter/nvim-treesitter-context", config = true },

    -- until treesitter matures
    "sheerun/vim-polyglot",
  },
}

function M.config()
  require("nvim-treesitter.configs").setup {
    ensure_installed = {
      "elixir",
      "javascript",
      "ruby",
    },

    auto_install = true,

    highlight = { enable = true },
    indent = { enable = true },

    additional_vim_regex_highlighting = true,
  }

  -- configure reformatting
  vim.opt.formatoptions:remove "t"
  vim.o.textwidth = 100

  -- configure folding
  vim.o.foldmethod = "expr"
  vim.o.foldexpr = "nvim_treesitter#foldexpr()"
  vim.o.foldenable = false
end

return M
