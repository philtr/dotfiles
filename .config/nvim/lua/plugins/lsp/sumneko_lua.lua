local M = {}

function M.setup(lsp)
  lsp.configure("sumneko_lua", {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        format = {
          enable = false,
        }
      },
    },
  })
end

return M
