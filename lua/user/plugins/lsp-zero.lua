local M = {
  'VonHeikemen/lsp-zero.nvim',
  event = "VeryLazy",
  dependencies = {
    -- LSP Support
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    -- Autocompletion
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',

    -- Snippets
    'L3MON4D3/LuaSnip',
    -- Snippet Collection (Optional)
    'rafamadriz/friendly-snippets',
  },
  config = function()
    local lsp = require('lsp-zero')
    local cmp = require('cmp')

    lsp.preset('recommended')

    local cmp_mappings = lsp.defaults.cmp_mappings({
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
    })

    lsp.setup_nvim_cmp({
      mapping = cmp_mappings
    })

    lsp.setup()

    local cmp_config = lsp.defaults.cmp_config({
      sources = {
        { name = "copilot", priority = 80 },
        { name = "luasnip", priority = 100 },
        { name = "nvim_lsp", priority = 90 },
        { name = "nvim_lsp_signature_help" },
        { name = "nvim_lua", priority = 90 },
        { name = "path", priority = 5 },
      },
    })

    cmp.setup(cmp_config)
  end
}
return M
