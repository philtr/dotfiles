local M = {
  "mileszs/ack.vim",

  dependencies = {
    "trouble.nvim",
  },
}

function M.init()
  -- Open the quickfix window with trouble.nvim
  vim.g.ack_qhandler = "Trouble quickfix"

  -- If they are installed, use ripgrep (rg) or the_silver_seearcher (ag), otherwise just use the default
  if vim.fn.executable "rg" == 1 then
    vim.g.ackprg = "rg --vimgrep --no-heading --no-messages"
  elseif vim.fn.executable "ag" == 1 then
    vim.g.ackprg = "ag --vimgrep"
  end
end

return M
