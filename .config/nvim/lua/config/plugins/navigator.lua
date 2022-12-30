local M = {
  "christoomey/vim-tmux-navigator",
}

function M.config()
  local bind = vim.keymap.set

  bind({ "t", "n" }, "<C-h>", "<C-w><C-h>", { silent = true })
  bind({ "t", "n" }, "<C-j>", "<C-w><C-j>", { silent = true })
  bind({ "t", "n" }, "<C-k>", "<C-w><C-k>", { silent = true })
  bind({ "t", "n" }, "<C-l>", "<C-w><C-l>", { silent = true })
end

return M
