local M = {
  "folke/trouble.nvim",

  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}

local function mappings()
  local opts = { silent = true, noremap = true }
  local bind = vim.keymap.set

  bind("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
  bind("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
  bind("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", opts)
  bind("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", opts)
  bind("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", opts)
  bind("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", opts)
end

function M.config()
  require("trouble").setup()
  mappings()
end

return M
