local M = {}

local cmp = require "cmp"

local sources = {
  { name = "luasnip", keyword_length = 2 },
  { name = "nvim_lsp", keyword_length = 3 },
  { name = "nvim_lsp_signature_help" },
  { name = "buffer", keyword_length = 3 },
  { name = "path" },
  { name = "emoji" },
}

local function with_defaults(options)
  local defaults = {
    preselect = cmp.PreselectMode.None,
    completion = {
      completeopt = "menu,menuone,noselect",
    },
  }

  return vim.tbl_extend("force", defaults, options)
end

function M.config(lsp)
  lsp.setup_nvim_cmp(with_defaults {
    sources = sources,
  })
end

function M.cmdline()
  -- Completions for '/' search
  cmp.setup.cmdline(
    { "/", "?" },
    with_defaults {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "nvim_lsp_document_symbol" },
      }, {
        { name = "buffer" },
      }),
    }
  )

  -- Completions for command mode.
  cmp.setup.cmdline(
    ":",
    with_defaults {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
    }
  )
end

return M
