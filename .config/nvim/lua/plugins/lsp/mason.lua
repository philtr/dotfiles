local M = {
  options = {
    ui = {
      border = "rounded",

      icons = {
        package_installed = " ",
        package_pending = " ",
        package_uninstalled = " ",
      },
    },
  },
}

function M.config()
  require("mason").setup(M.options)
end

return M
