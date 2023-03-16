local M = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  dependencies = {
    -- display nested context at top of window
    { "nvim-treesitter/nvim-treesitter-context", config = true },
    -- highlight nested delimiters a different color
    { "HiPhish/nvim-ts-rainbow2" },
    -- dims inactive portions of the code you're editing
    { "folke/twilight.nvim" },
    -- Navigate around your document based on treesitter
    { "drybalka/tree-climber.nvim" },
  },
}

function M.config()
  require("nvim-treesitter.configs").setup {
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },

    rainbow = {
      enable = true,
      -- list of languages you want to disable the plugin for
      -- disable = { "jsx", "cpp" },
      -- Which query to use for finding delimiters
      query = "rainbow-parens",
      -- Highlight the entire buffer all at once
      strategy = require "ts-rainbow.strategy.global",
    },
  }

  -- configure folding
  vim.o.foldmethod = "expr"
  vim.o.foldexpr = "nvim_treesitter#foldexpr()"
  vim.o.foldenable = false

  -- Select Nodes in Visual Mode using tree-climber
  local keyopts = { noremap = true, silent = true }

  vim.keymap.set({ "n", "v", "o" }, "H", require("tree-climber").goto_parent, keyopts)
  vim.keymap.set({ "n", "v", "o" }, "L", require("tree-climber").goto_child, keyopts)

  vim.keymap.set({ "n", "v", "o" }, "J", function()
    require("tree-climber").goto_next { skip_comments = true }
  end, keyopts)

  vim.keymap.set({ "n", "v", "o" }, "K", function()
    require("tree-climber").goto_prev { skip_comments = true }
  end, keyopts)

  vim.keymap.set({ "v", "o" }, "in", require("tree-climber").select_node, keyopts)
end

return M
