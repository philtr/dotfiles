local keymap = {
  defaults = {
    groups = {
      navigate_tabs = { enabled = true },
      resize_splits = { enabled = true },
    },

    options = {
      silent = true,
      noremap = true,
    },
  },

  groups = {},
}

local bind = vim.keymap.set

keymap.groups.navigate_tabs = function(opts)
  opts = opts or {}

  bind("", "<Leader>l", ":tabnext<CR>", opts)
  bind("", "<Leader>h", ":tabprevious<CR>", opts)
end

-- resize windows with arrow keys
keymap.groups.resize_splits = function(opts)
  opts = opts or {}

  bind("", "<up>", "3<C-W>+", opts)
  bind("", "<down>", "3<C-W>-", opts)
  bind("", "<left>", "7<C-W><", opts)
  bind("", "<right>", "7<C-W>>", opts)

  -- terminal mode
  bind("t", "<up>", "<C-\\><C-n>3<C-W>+i", opts)
  bind("t", "<down>", "<C-\\><C-n>3<C-W>3<C-W>-i", opts)
  bind("t", "<left>", "<C-\\><C-n>3<C-W>7<C-W><i", opts)
  bind("t", "<right>", "<C-\\><C-n>3<C-W>7<C-W>>i", opts)
end

keymap.setup = function(opts)
  opts = opts or {}
  opts = vim.tbl_extend("force", keymap.defaults, opts) or {}

  for group, init in pairs(keymap.groups) do
    if opts.groups[group].enabled == true then
      if type(init) == "function" then
        init(opts.options)
      else
        vim.notify(
          "Value for keymap group " .. group .. " should be a function",
          vim.log.levels.ERROR
        )
      end
    end
  end
end

return keymap
