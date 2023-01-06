return {
  -- In addition to the plugin specs below, lazy.nvim will merge any lua file in
  -- config/plugins/*.lua into the main plugin spec

  -- Seamless navigation between tmux panes and vim splits
  "christoomey/vim-tmux-navigator",

  -- Neovim setup with full signature help, docs and completion for the nvim lua API.
  { "folke/neodev.nvim", config = true },
}
