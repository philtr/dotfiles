local M = {
  "cappyzawa/trim.nvim",
}

function M.config()
  require("trim").setup {
    ft_blocklist = {
      "markdown",
    },

    trim_trailing = true,
    trim_last_line = true,
    trim_first_line = true,
  }
end

return M
