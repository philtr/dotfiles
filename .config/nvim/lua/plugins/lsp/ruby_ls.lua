local M = {}

function M.setup(lsp)
  lsp.configure("ruby_ls", {
    init_options = {
      enabledFeatures = {
        "codeActions",
        "diagnostics",
        "documentHighlights",
        "documentSymbols",
        "inlayHint",
      },
    },
  })
end

return M
