local M = {}

function M.config()
  vim.keymap.set("n", "<Leader>f", "<cmd>LspZeroFormat<CR>")

  vim.cmd [[
    function! LspZeroAutoformat()
      if exists(':LspZeroFormat')
        LspZeroFormat
      endif
    endfunction

    function! LspZeroEnableAutoformat()
        augroup LspZeroAutoformat
          autocmd!
          autocmd BufWritePre * :call LspZeroAutoformat()
        augroup end
    endfunction

    function! LspZeroDisableAutoformat()
        augroup LspZeroAutoformat
          autocmd!
        augroup end
    endfunction

    function! LspZeroToggleAutoformat()
      if !exists('#LspZeroAutoformat#BufWritePre')
        call LspZeroEnableAutoformat()
      else
        call LspZeroDisableAutoformat()
      endif
    endfunction

    call LspZeroEnableAutoformat()

    command! LspZeroToggleAutoformat call LspZeroToggleAutoformat()
    command! LspZeroDisableAutoformat call LspZeroDisableAutoformat()
    command! LspZeroEnableAutoformat call LspZeroEnableAutoformat()
  ]]
end

return M
