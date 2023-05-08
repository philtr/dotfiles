return {
  {
    "stevearc/dressing.nvim",
    -- improve the default vim.ui interfaces

    lazy = false,
  },

  {
    "rcarriga/nvim-notify",
    -- A fancy, configurable, notification manager

    lazy = false,
  },

  {
    "alvarosevilla95/luatab.nvim",
    -- Tabline lua plugin for neovim

    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("luatab").setup {}
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    -- A blazing fast and easy to configure statusline plugin

    lazy = false,
    config = function()
      require("lualine").setup {
        options = {
          theme = "tokyonight",
        },
      }
    end,
  },
  {
    "b0o/incline.nvim",
    -- 🎈 Floating statuslines for Neovim

    lazy = false,
    config = function()
      vim.o.laststatus = 3
      require("incline").setup()
    end
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      -- char = "▏",
      char = "│",
      filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
      show_trailing_blankline_indent = false,
      show_current_context = false,
    },
  },

  {
    "folke/noice.nvim",
    -- completely replaces the UI for messages, cmdline and the popupmenu

    enabled = false,
    lazy = false,
    dependencies = { "rcarriga/nvim-notify", "MunifTanjim/nui.nvim" },
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
        },
        hover = { enabled = false },
        signature = { enabled = false },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
      },
    },
  },

  {
    "MunifTanjim/nui.nvim",
    -- UI Component Library for Neovim.

    lazy = false,
  },

  {
    "echasnovski/mini.indentscope",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = { "BufReadPre", "BufNewFile" },
    opts = function()
      return {
        symbol = "│",
        options = { try_as_border = true },
        draw = {
          animation = require("mini.indentscope").gen_animation.none(),
        },
      }
    end,
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
    config = function(_, opts)
      require("mini.indentscope").setup(opts)
    end,
  },

  {
    "SmiteshP/nvim-navic",
    -- shows your current code context in winbar/statusline

    lazy = false,
    opts = {
      separator = " ",
      highlight = true,
      depth_limit = 5,
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    -- Git integration for buffers

    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
    },
  },
}
