local M = { "mileszs/ack.vim" }

function M.init()
  vim.cmd [[
    if executable("rg")
      let g:ackprg = 'rg --vimgrep --no-heading --no-messages'
    elseif executable("ag")
      let g:ackprg = 'ag --vimgrep'
    endif
  ]]
end

return M
