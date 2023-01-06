local M = {
  "nvim-telescope/telescope.nvim",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "natecraddock/telescope-zf-native.nvim",
  },
}

local function mappings()
  local bind = vim.keymap.set

  bind("n", "<Leader>p", "<cmd>Telescope find_files<CR>")
  bind("n", "<Leader>g", "<cmd>Telescope git_files<CR>")
  bind("n", "<Leader>b", "<cmd>Telescope buffers<CR>")
  bind("n", "<Leader>gr", "<cmd>Telescope live_grep<CR>")
  bind("n", "<Leader>fb", "<cmd>Telescope file_browser<CR>")
end

function M.config()
  local telescope = require "telescope"
  local themes = require "telescope.themes"

  telescope.setup {
    defaults = themes.get_ivy {
      layout_config = {
        height = 15,
      },
    },

    pickers = {
      live_grep = { layout_config = { height = 30 } },
    },

    extensions = {
      file_browser = {
        dir_icon = "",
        layout_config = { height = 100 },
      },
    },
  }

  telescope.load_extension "zf-native"
  telescope.load_extension "file_browser"

  mappings()
end

return M
