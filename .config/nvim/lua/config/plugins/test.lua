local M = {
  "vim-test/vim-test",
}

local function mappings()
  local keyopts = { silent = true }
  local bind = vim.keymap.set

  bind("n", "<Leader>ss", ":TestFile<CR>", keyopts)
  bind("n", "<Leader>sn", ":TestNearest<CR>", keyopts)
  bind("n", "<Leader>sl", ":TestLast<CR>", keyopts)
  bind("n", "<Leader>sa", ":TestSuit<CR>", keyopts)
end

local function setup(options, prefix)
  prefix = prefix or "test#"
  for setting, value in pairs(options or {}) do
    if type(value) == "table" then
      setup(value, prefix .. setting)
    else
      vim.g[prefix .. setting] = value
    end
  end
end

function M.config()
  setup {
    -- Runs test commands with :terminal in a split window.
    strategy = "neovim",
    neovim = {
      -- Start :terminal in normal mode
      start_normal = 1,
      -- Open the :terminal 20 lines tall across the bottom
      term_position = "botright 20",
    },
    -- Disallow strategies to clear the screen
    preserve_screen = 1,
  }

  mappings()
end

return M
