return {
  "nvim-telescope/telescope.nvim",
  cmd = { "Telescope" },

  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-file-browser.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },

  config = function()
    require('telescope').setup {
      defaults = {
        theme = ivy
      },
      extensions = {
        file_browser = {
          dir_icon = "▶"
        },
        fzf = {
          fuzzy = true,                    -- false will only do exact matching
          override_generic_sorter = true,  -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
        }
      }
    }

    require("telescope").load_extension("file_browser")
    require("telescope").load_extension("fzf")
  end,

  init = function()
    vim.keymap.set('n', '<Leader>p', '<cmd>Telescope find_files<CR>')
    vim.keymap.set('n', '<Leader>m', '<cmd>Telescope frecency<CR>')
    vim.keymap.set('n', '<Leader>b', '<cmd>Telescope buffers<CR>')
    vim.keymap.set('n', '<Leader>gr', '<cmd>Telescope live_grep<CR>')
    vim.keymap.set('n', '<Leader>tt', '<cmd>Telescope file_browser<CR>')
  end,
}
