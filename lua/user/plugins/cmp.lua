local cmdline = false
local M = {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-emoji",
    { "hrsh7th/cmp-cmdline", enabled = cmdline },
    { "dmitmel/cmp-cmdline-history", enabled = cmdline },
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
  },
}

function M.config()
  vim.o.completeopt = "menuone,noselect"

  -- Setup nvim-cmp.
  local cmp = require("cmp")

  cmp.setup({
    completion = {
      completeopt = "menu,menuone,noinsert",
    },
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ["<Up>"] = cmp.mapping.select_prev_item(),
      ["<Down>"] = cmp.mapping.select_next_item(),
      ["<C-Up>"] = cmp.mapping.scroll_docs(-6),
      ["<C-Down>"] = cmp.mapping.scroll_docs(2),
      ["<Space>"] = cmp.mapping.confirm(),
      ["<C-Space>"] = cmp.mapping.complete({}),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
      { name = "copilot" },
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "path" },
      { name = "emoji" },
      { name = "neorg" },
    }),
    formatting = {
      format = require("user.plugins.lsp.kind").cmp_format(),
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    -- documentation = {
    --   border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    --   winhighlight = "NormalFloat:NormalFloat,FloatBorder:TelescopeBorder",
    -- },
    experimental = {
      ghost_text = {
        hl_group = "LspCodeLens",
      },
    },
    -- sorting = {
    --   comparators = {
    --     cmp.config.compare.sort_text,
    --     cmp.config.compare.offset,
    --     -- cmp.config.compare.exact,
    --     cmp.config.compare.score,
    --     -- cmp.config.compare.kind,
    --     -- cmp.config.compare.length,
    --     cmp.config.compare.order,
    --   },
    -- },
  })
  if cmdline then
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        -- { name = "noice_popupmenu" },
        { name = "path" },
        { name = "cmdline" },
        -- { name = "cmdline_history" },
      }),
    })
  end
end

return M
