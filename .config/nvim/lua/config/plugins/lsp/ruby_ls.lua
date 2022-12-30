local M = {}

function M.setup(lsp)
  lsp.configure("ruby_ls", {
    settings = {
      rubyLsp = {
        enabledFeatures = {
          "codeActions",
          "diagnostics",
          "documentHighlights",
          "documentSymbols",
          "formatting",
          "inlayHint",
        },
      },
    },
  })
end

return M
