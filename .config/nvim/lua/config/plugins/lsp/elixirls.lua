local M = {}

function M.setup(lsp)
  lsp.configure("elixirls", {
    settings = {
      elixirLS = {
        dialyzerEnabled = true,
        fetchDeps = true,
        enableTestLenses = false,
        suggestSpecs = false,
      },
    },
  })
end

return M
