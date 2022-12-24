return {
  "christoomey/vim-tmux-navigator",
  "jeffkreeftmeijer/vim-dim",
  "tpope/vim-commentary",
  "neovim/nvim-lspconfig",

  {
    "mileszs/ack.vim",
    init = function()
      vim.cmd [[
        if executable("rg")
          let g:ackprg = 'rg --vimgrep --no-heading --no-messages'
        elseif executable("ag")
          let g:ackprg = 'ag --vimgrep'
        endif
      ]]
    end,
  },

  {
    "mhanberg/elixir.nvim",
    ft = {"elixir", "eelixir"},
    init = function()
      local elixir = require("elixir")

      elixir.setup({
        settings = elixir.settings({
          dialyzerEnabled = true,
          fetchDeps = true,
          enableTestLenses = true,
          suggestSpecs = true,
        }),
      })
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    cmd = { "Telescope" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    config = function()
      require('telescope').setup{
        defaults = {
          -- Default configuration for telescope goes here:
          -- config_key = value,
          mappings = {
            i = {
              -- map actions.which_key to <C-h> (default: <C-/>)
              -- actions.which_key shows the mappings for your picker,
              -- e.g. git_{create, delete, ...}_branch for the git_branches picker
              ["<C-h>"] = "which_key"
            }
          },
        },
        pickers = {
          -- Default configuration for builtin pickers goes here:
          -- picker_name = {
          --   picker_config_key = value,
          --   ...
          -- }
          -- Now the picker_config_key will be applied every time you call this
          -- builtin picker
        },
        extensions = {
          -- Your extension configuration goes here:
          -- extension_name = {
          --   extension_config_key = value,
          -- }
          -- please take a look at the readme of the extension you want to configure
          file_browser = {
            dir_icon = "▶"
          },
          fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
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
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-cmdline",
      "dmitmel/cmp-cmdline-history",
      "hrsh7th/cmp-path",
      "hrsh7th/vim-vsnip",
      "hrsh7th/cmp-vsnip",
    },
    init = function()
      local cmp = require("cmp")

      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end
        },
        mapping = {
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "vsnip" },
          { name = "buffer" },
        })
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    init = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { "ruby", "elixir", "javascript" },
        auto_install = true,
        highlight = {
          enable = true
        }
      })
    end,
  },
}
