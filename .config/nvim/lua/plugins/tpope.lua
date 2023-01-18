local M = {
  -- Classic vim plugins from the infamous Tim Pope

  { -- Comment stuff out.
    "tpope/vim-commentary",
    event = "BufReadPost",
  },

  { -- Fugitive is the premier Vim plugin for Git. Or maybe it's the premier
    -- Git plugin for Vim? Either way, it's "so awesome, it should be illegal".
    -- That's why it's called Fugitive.
    "tpope/vim-fugitive",
    cmd = "Git",
  },

  { -- Surround.vim is all about "surroundings": parentheses, brackets, quotes,
    -- XML tags, and more.
    "tpope/vim-surround",
    event = "BufReadPost",
  },
}

return M
