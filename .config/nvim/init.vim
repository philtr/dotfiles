
call plug#begin()
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mileszs/ack.vim'
call plug#end()

colors industry

set nowrap

let mapleader=","

nmap <Leader>p :CtrlP<CR>
nmap <Leader>b :CtrlPBuffer<CR>

let g:ctrlp_use_caching = 0
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
