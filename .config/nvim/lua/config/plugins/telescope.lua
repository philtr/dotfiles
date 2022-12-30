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

  bind("n", "<Leader>p", "<cmd>Telescope find_files theme=ivy<CR>")
  bind("n", "<Leader>b", "<cmd>Telescope buffers theme=ivy<CR>")
  bind("n", "<Leader>gr", "<cmd>Telescope live_grep theme=ivy<CR>")
  bind("n", "<Leader>tt", "<cmd>Telescope file_browser theme=ivy<CR>")
end

local options = {
  extensions = {
    file_browser = {
      dir_icon = "▶",
    },
  },
}

function M.config()
  require("telescope").setup(options)
  require("telescope").load_extension "file_browser"
  require("telescope").load_extension "zf-native"

  mappings()
end

return M
