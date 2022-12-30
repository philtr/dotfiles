local set = vim.o

-- key settings
vim.g.mapleader = ","

-- editing options
set.wrap = false
set.tabstop = 2
set.shiftwidth = 2
set.expandtab = true

-- use the system clipboard
vim.cmd [[set clipboard+=unnamedplus]]

-- hide buffers instead of closing them
set.hidden = true

-- undo even after a buffer is closed
set.undofile = true
set.undodir = vim.fn.expand "$HOME/.local/share/nvim/undo/"

-- backup and swap files
set.backup = false
set.wb = false
set.swapfile = false
