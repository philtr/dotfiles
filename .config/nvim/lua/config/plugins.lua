-- lazy.nvim will merge any lua file in config/plugins/*.lua into the main plugin spec
return {
  "christoomey/vim-tmux-navigator",
  "jeffkreeftmeijer/vim-dim",
  "tpope/vim-commentary",

  {
    "mileszs/ack.vim",
    init = function()
      vim.cmd [[
        if executable("rg")
          let g:ackprg = 'rg --vimgrep --no-heading --no-messages'
        elseif executable("ag")
          let g:ackprg = 'ag --vimgrep'
        endif
      ]]
    end,
  },
}
