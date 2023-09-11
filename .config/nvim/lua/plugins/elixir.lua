return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "elixir",
        "heex",
        "eex",
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "elixir-ls",
      })
    end,
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      -- This is a fork of "jfpedroza/neotest-elixir" that supports umbrella projects
      "philtr/neotest-elixir",
    },
    opts = {
      adapters = {
        ["neotest-elixir"] = {},
      },
    },
  },
}
