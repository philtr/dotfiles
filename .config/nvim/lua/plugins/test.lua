local M = {
  "vim-test/vim-test",

  event = "BufReadPost",

  dependencies = {
    "preservim/vimux",
  },
}

local function mappings()
  local keyopts = { silent = true }
  local bind = vim.keymap.set

  bind("n", "<Leader>ss", ":TestFile<CR>", keyopts)
  bind("n", "<Leader>sn", ":TestNearest<CR>", keyopts)
  bind("n", "<Leader>sl", ":TestLast<CR>", keyopts)
  bind("n", "<Leader>sa", ":TestSuit<CR>", keyopts)

  if vim.g["test#strategy"] == "vimux" then
    bind("n", "<Leader>s-", ":VimuxCloseRunner<CR>", keyopts)
  end
end

local function setup(options, prefix)
  prefix = prefix or "test#"
  for setting, value in pairs(options or {}) do
    if type(value) == "table" then
      setup(value, prefix .. setting)
    else
      if type(value) == "function" then
        value = value()
      end

      vim.g[prefix .. setting] = value
    end
  end
end

function M.config()
  setup {
    strategy = function()
      -- use vimux if tmux is running, otherwise open a neovim terminal
      if os.getenv "TMUX" == nil then
        return "neovim"
      else
        return "vimux"
      end
    end,

    -- Runs test commands with :terminal in a split window.
    neovim = {
      -- Start :terminal in normal mode
      start_normal = 1,
      -- Open the :terminal 20 lines tall across the bottom
      term_position = "botright 20",
    },

    -- clear the screen with each test run
    preserve_screen = 0,
  }

  -- prefer to make a new split if unsure
  vim.g.VimuxUseNearest = 0

  mappings()
end

return M
