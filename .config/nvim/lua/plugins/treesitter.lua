local M = {
  "nvim-treesitter/nvim-treesitter",

  build = ":TSUpdate",
  event = "BufReadPost",

  dependencies = {
    -- display nested context at top of window
    { "nvim-treesitter/nvim-treesitter-context", config = true },
  },
}

function M.config()
  require("nvim-treesitter.configs").setup {
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },

    additional_vim_regex_highlighting = true,
  }

  -- configure folding
  vim.o.foldmethod = "expr"
  vim.o.foldexpr = "nvim_treesitter#foldexpr()"
  vim.o.foldenable = false
end

return M
