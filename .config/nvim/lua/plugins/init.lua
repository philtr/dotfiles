return {
  -- In addition to the plugin specs below, lazy.nvim will merge any lua file in
  -- plugins/*.lua into the main plugin spec

  -- Seamless navigation between tmux panes and vim splits
  {
    "christoomey/vim-tmux-navigator",

    lazy = false,

    init = function()
      local bind = vim.keymap.set

      bind({ "t", "n" }, "<C-h>", "<C-w><C-h>", { silent = true })
      bind({ "t", "n" }, "<C-j>", "<C-w><C-j>", { silent = true })
      bind({ "t", "n" }, "<C-k>", "<C-w><C-k>", { silent = true })
      bind({ "t", "n" }, "<C-l>", "<C-w><C-l>", { silent = true })
    end,
  },

  -- Neovim setup with full signature help, docs and completion for the nvim lua API.
  { "folke/neodev.nvim", config = true },
}
