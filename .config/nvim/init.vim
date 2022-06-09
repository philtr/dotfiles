"//////////////////////////////////////////////////////////////////////////////////////////////////
"               __   _(_)_ __ ___          _ __ | |__ (_) | |_ _ __
"               \ \ / / | '_ ` _ \  _____ | '_ \| '_ \| | | __| '__|
"                \ V /| | | | | | | _____ | |_) | | | | | | |_| |
"                 \_/ |_|_| |_| |_|       | .__/|_| |_|_|_|\__|_|
"= Initial setup =========================|_|======================================================

  set encoding=utf8   " use UTF-8 encoding for the win
  set hidden          " Don't abandon buffers that are not showing

"= Plug.vim =======================================================================================

  " A minimalist Vim plugin manager.
  " See https://github.com/junegunn/vim-plug for more information

  call plug#begin()

    Plug 'benmills/vimux',                        " Easily interact with tmux from vim.
          \ { 'on': 'VimuxRunCommand' }
    Plug 'chrisbra/NrrwRgn',                      " Open a new buffer with the current visual block
          \ { 'on': 'NarrowRegion' }
    Plug 'christoomey/vim-tmux-navigator'         " Navigate seamlessly between vim and tmux splits
    Plug 'dense-analysis/ale'                     " Asynchronous Lint Engine (ALE)
    Plug 'junegunn/goyo.vim',                     " Distraction-free writing in Vim
          \ { 'on': 'Goyo' }
    Plug 'metakirby5/codi.vim',                   " Interactive scratchpad like Soulver or Numi
          \ { 'on': 'Codi' }
    Plug 'mileszs/ack.vim',                       " Frontend for ack-compatible search tools
          \ { 'on': 'Ack' }
    Plug 'neoclide/coc.nvim',                     " Nodejs extension host for vim
          \ { 'branch': 'release' }

    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-file-browser.nvim'
    Plug 'nvim-telescope/telescope-frecency.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

    Plug 'plasticboy/vim-markdown'                " Markdown syntax & utilities
    Plug 'sheerun/vim-polyglot'                   " Lazy-loading multi-language pack
    Plug 'tami5/sqlite.lua'
    Plug 'tpope/vim-commentary',                  " Easy code commenting
          \ { 'on': 'Commentary' }
    Plug 'tpope/vim-rails'                        " Ruby on Rails power tools
    Plug 'vim-test/vim-test'                      " Run your tests at the speed of thought

  call plug#end()


"= Appearance ===================================================================================

  set background=dark
  colorscheme peachpuff
  highlight LineNr ctermfg=black
  highlight CocFloating ctermbg=black ctermfg=white

  syntax on                           " turn on syntax highilghting

  filetype plugin on                  " enable loading plugins for filetypes
  filetype indent on                  " enable loading 'indent files' for filetypes

  set nocursorline                    " don't highlight line under cursor
  set synmaxcol=800                   " no syntax highlighting for lines longer than 100 cols
  set laststatus=2                    " always show status bar
  set number                          " display line numbers
  set visualbell                      " use visual bell
  set t_ut=                           " disable background color erase
  set hlsearch                        " highlight all search matches

  set list listchars=tab:██,trail:∙   " Use "██" for tabs and "∙" for trailing spaces
  set fillchars+=vert:                " set vertical fillchar to "en space"

"= Interaction ==================================================================================

  set autoread                    " automatically reload unmodified buffers when edited externally
  set ttyfast                     " improve screen refresh for terminal vim
  set lazyredraw                  " screen not redrawn during command execution
  set scrolloff=3                 " start scrolling 3 lines from bottom
  set sidescrolloff=6             " start scrolling 6 lines from right
  set mouse=a                     " allow mouse usage
  set clipboard=unnamed           " use the system clipboard
  set backspace=indent,eol,start  " Make backspace behave as expected
  set re=1                        " Use old RegEx engine because vim-ruby doesn't like it

"= Wrapping =====================================================================================

  set nowrap                      " don't softwrap text
  set formatoptions-=t            " don't automatically hardwrap text (use 'gq' to reflow text)
  set textwidth=80                " wrap at column 80
  set wrapmargin=0                " don't wrap based on terminal size

"= Indentation ==================================================================================

  set autoindent                  " indent next line to same level as current line
  set smarttab                    " <Tab> in front of a line inserts 'shiftwidth' blanks
  set shiftwidth=2                "   ↑ use 2 blanks for above
  set tabstop=2                   " display a <Tab> as 2 spaces
  set softtabstop=2               " use 2 spaces for a <Tab>
  set expandtab                   "   ↑ insert spaces when <Tab> key is ressed

"= Utilities ======================================================================================

  set nobackup                      " don't create backup files
  set nowb                          " don't make a backup before overwriting a file
  set noswapfile                    " don't use swap files

  set undofile                      " save undo history a file to persist across sessions
  set undodir=~/.vim/undo/          " put undo files in ~/.vim/undo/path%to$file.ext

"= Keys ===========================================================================================

  " Fearless leader!
  let mapleader = ','

  " Use same pane navigation shortcuts in terminal split
  tnoremap <silent> <C-h> <C-w><C-h>
  tnoremap <silent> <C-j> <C-w><C-j>
  tnoremap <silent> <C-k> <C-w><C-k>
  tnoremap <silent> <C-l> <C-w><C-l>

  " Use arrow keys to resize windows
  noremap <up>    <C-W>+
  noremap <down>  <C-W>-
  noremap <left>  3<C-W><
  noremap <right> 3<C-W>>

  " Tab Navigation
  nmap <Leader>l :tabnext<CR>
  nmap <Leader>h :tabprevious<CR>

  " Transpose the line(s) under the cursor one line down
  nmap <Leader>k ddp
  " Transpose the line(s) under the cursor one line up
  nmap <Leader>K ddkP
  " Transpose character(s) under the cursor one position to the right
  nmap <Leader>x xp
  " Transpose character(s) under the cursor one position to the left
  nmap <Leader>X xhP


"= Ack ============================================================================================

  if executable("rg")
    let g:ackprg = 'rg --vimgrep --no-heading --no-messages'
  elseif executable("ag")
    let g:ackprg = 'ag --vimgrep'
  endif

"= Asynchronous Lint Engine (ALE) =================================================================

  let g:ale_fix_on_save = 1
  let g:ale_ruby_rubocop_executable = "bundle"
  let g:ale_ruby_rubocop_options = "--cache true"
  let g:ale_fixers = {
        \ '*': ['remove_trailing_lines', 'trim_whitespace'],
        \ 'ruby': ['rubocop']
        \ }
  let g:ale_linters = { 'ruby': ['rubocop'] }

"= CoC.nvim =======================================================================================

  nnoremap gd :call CocAction('jumpDefinition')<CR>
  nnoremap <C-]> :call CocAction('jumpDefinition')<CR>
  nnoremap <C-t> <C-o>

  " Use tab for trigger completion with characters ahead and navigate.
  " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
  " other plugin before putting this into your config.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

"= Lualine ========================================================================================

lua << END
  require('lualine').setup {
    options = {
      icons_enabled = false,
      theme = '16color'
    },
    sections = {
      lualine_a = {''},
      lualine_b = {'filename'},
      lualine_c = {'diff', 'diagnostics'},
      lualine_x = {},
      lualine_y = {'branch'},
      lualine_z = {'mode'},
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {'branch'},
    }
  }
END

"= Markdown =======================================================================================

  let g:vim_markdown_folding_disabled = 1

  let g:vim_markdown_fenced_languages = [
  \ 'css', 'sass', 'scss',
  \ 'haml', 'html',
  \ 'javascript', 'js=javascript', 'json=javascript',
  \ 'ruby',
  \]

  " Use 2 spaces for list item indents
  let g:vim_markdown_new_list_item_indent = 2

  augroup Markdown
    " Use markdown for *.md files
    autocmd BufRead,BufNewFile *.md setf markdown
  augroup END

"= Ruby/Rails =====================================================================================

  let g:ruby_path = $HOME.'/.asdf/shims/ruby'
  let g:ruby_indent_assignment_style = 'variable'

  augroup Rails
    au BufRead,BufNewFile *.jbuilder setf ruby    " Use Ruby for .jbuilder files
    au BufRead,BufNewFile .env.local,.env.development,.env.test setf sh   " Use Shell for .env files
  augroup END

  " Pry
  nmap <Leader><Leader>pry Irequire "pry"; binding.pry;<CR><Esc>

"= Telescope ======================================================================================

lua << EOF

    require('telescope').setup{
      defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
          i = {
            -- map actions.which_key to <C-h> (default: <C-/>)
            -- actions.which_key shows the mappings for your picker,
            -- e.g. git_{create, delete, ...}_branch for the git_branches picker
            ["<C-h>"] = "which_key"
          }
        }
      },
      pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
      },
      extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
        file_browser = {
          dir_icon = "▶"
        },
        fzf = {
          fuzzy = true,                    -- false will only do exact matching
          override_generic_sorter = true,  -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                           -- the default case_mode is "smart_case"
        }
      }
    }

    require("telescope").load_extension("file_browser")
    require("telescope").load_extension("frecency")
    require("telescope").load_extension("fzf")

EOF

  nnoremap <Leader>p <cmd>Telescope find_files<CR>
  nnoremap <Leader>m <cmd>Telescope frecency<CR>
  nnoremap <Leader>b <cmd>Telescope buffers<CR>
  nnoremap <Leader>gr <cmd>Telescope live_grep<CR>
  nnoremap <Leader>tt <cmd>Telescope file_browser<CR>

"= Testing ========================================================================================

  let test#strategy="vimux"

  map <Leader>ss :TestFile<CR>
  map <Leader>sn :TestNearest<CR>
  map <Leader>sl :TestLast<CR>
  map <Leader>sa :TestSuite<CR>
