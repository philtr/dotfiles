local M = {}

local cmp = require "cmp"
local luasnip = require "luasnip"

local sources = {
  { name = "luasnip", keyword_length = 2 },
  { name = "nvim_lsp", keyword_length = 3 },
  { name = "nvim_lsp_signature_help" },
  { name = "buffer", keyword_length = 3 },
  { name = "path" },
  { name = "emoji" },
}

local function snipjump(distance)
  return cmp.mapping(function(fallback)
    if luasnip.jumpable(distance) then
      luasnip.jump(distance)
    else
      fallback()
    end
  end, { "i", "s" })
end

local mappings = {
  ["<Tab>"] = snipjump(1),
  ["<S-Tab>"] = snipjump(-1),
}

function M.config(lsp)
  lsp.setup_nvim_cmp {
    sources = sources,
    mapping = lsp.defaults.cmp_mappings(mappings),
  }
end

function M.cmdline()
  -- Completions for '/' search
  cmp.setup.cmdline({ "/", "?" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = "nvim_lsp_document_symbol" },
    }, {
      { name = "buffer" },
    }),
  })

  -- Completions for command mode.
  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = "path" },
    }, {
      { name = "cmdline" },
    }),
  })
end

return M
