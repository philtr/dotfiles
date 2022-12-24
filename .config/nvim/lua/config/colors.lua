vim.cmd [[
  colorscheme dim
  highlight Comment cterm=italic gui=italic
  highlight StatusLine cterm=italic ctermbg=NONE ctermfg=7
  highlight StatusLineNC cterm=italic ctermbg=NONE ctermfg=8
]]

vim.cmd [[
  highlight link NormalFloat Normal 
]]

vim.cmd [[
  set fillchars+=vert:\ 
  highlight VertSplit ctermfg=NONE ctermbg=NONE
]]
