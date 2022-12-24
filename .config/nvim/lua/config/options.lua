-- key settings
vim.g.mapleader = ","

-- navigate splits
vim.keymap.set({'t', 'n'}, '<C-h>', '<C-w><C-h>', { silent=true })
vim.keymap.set({'t', 'n'}, '<C-j>', '<C-w><C-j>', { silent=true })
vim.keymap.set({'t', 'n'}, '<C-k>', '<C-w><C-k>', { silent=true })
vim.keymap.set({'t', 'n'}, '<C-l>', '<C-w><C-l>', { silent=true })

-- editing options
vim.o.wrap = false
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- hide buffers instead of closing them
vim.o.hidden = true

-- undo even after a buffer is closed
vim.o.undofile = true
vim.o.undodir = vim.fn.expand("$HOME/.local/share/nvim/undo/")

-- backup and swap files
vim.o.backup = false
vim.o.wb = false
vim.o.swapfile = false
