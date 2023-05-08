local M = {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' },
    {
      'williamboman/mason.nvim',
      build = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    { 'williamboman/mason-lspconfig.nvim' }, -- Optional

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },     -- Required
    { 'hrsh7th/cmp-nvim-lsp' }, -- Required
    { 'L3MON4D3/LuaSnip' },     -- Required
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-nvim-lsp-signature-help" },
    { "hrsh7th/cmp-nvim-lua" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-emoji" },
    { "hrsh7th/cmp-cmdline" },
    { "hrsh7th/cmp-nvim-lsp-document-symbol" },
    { "saadparwaiz1/cmp_luasnip" },

    -- Inject non-LSP info into neovim
    "jose-elias-alvarez/null-ls.nvim",
    "jay-babu/mason-null-ls.nvim",
  }
}

function M.config_lsp(lsp)
  lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
  end)

  -- When you don't have mason.nvim installed
  -- You'll need to list the servers installed in your system
  lsp.setup_servers({ 'tsserver', 'eslint' })

  -- (Optional) Configure lua language server for neovim
  require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

  lsp.setup()
end

function M.config_cmp()
  local cmp = require('cmp')
  local cmp_action = require('lsp-zero').cmp_action()

  cmp.setup({
    sources = {
      { name = 'path' },
      { name = 'nvim_lsp' },
      { name = 'buffer',  keyword_length = 3 },
      { name = 'luasnip', keyword_length = 2 },
      { name = 'emoji',   keyword_length = 2 },
      { name = 'cmdline' },
    },
    mapping = {
      ['<C-f>'] = cmp_action.luasnip_jump_forward(),
      ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    }
  })
end

function M.config_null_ls()
  local null_ls = require('null-ls')

  null_ls.setup({
    sources = {
      -- Replace these with the tools you have installed
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.diagnostics.eslint,
      null_ls.builtins.formatting.stylua,
    }
  })
end

function M.config_autoformat()
  vim.keymap.set("n", "<Leader>f", "<cmd>LspZeroFormat<CR>")

  vim.cmd [[
    function! LspZeroAutoformat()
      if exists(':LspZeroFormat')
        LspZeroFormat
      endif
    endfunction
    function! LspZeroEnableAutoformat()
        augroup LspZeroAutoformat
          autocmd!
          autocmd BufWritePre * :call LspZeroAutoformat()
        augroup end
    endfunction
    function! LspZeroDisableAutoformat()
        augroup LspZeroAutoformat
          autocmd!
        augroup end
    endfunction
    function! LspZeroToggleAutoformat()
      if !exists('#LspZeroAutoformat#BufWritePre')
        call LspZeroEnableAutoformat()
      else
        call LspZeroDisableAutoformat()
      endif
    endfunction
    call LspZeroEnableAutoformat()
    command! LspZeroToggleAutoformat call LspZeroToggleAutoformat()
    command! LspZeroDisableAutoformat call LspZeroDisableAutoformat()
    command! LspZeroEnableAutoformat call LspZeroEnableAutoformat()
  ]]
end

function M.config()
  local lsp = require('lsp-zero').preset({})

  M.config_lsp(lsp)
  M.config_cmp()
  M.config_autoformat()
end

return M
