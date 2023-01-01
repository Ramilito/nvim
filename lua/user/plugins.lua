local M = {
  -- {"folke/tokyonight.nvim", lazy = false, priority = 100 },
  -- { "williamboman/mason-lspconfig.nvim", lazy = false },
  -- { "neovim/nvim-lspconfig", lazy = false },
  "nvim-lua/plenary.nvim",
  {"jose-elias-alvarez/typescript.nvim", lazy = true},
  {"windwp/nvim-spectre", lazy = true},
  {"mbbill/undotree", lazy = true},
  -- "folke/twilight.nvim",
  { "akinsho/toggleterm.nvim", lazy = true },
  { "famiu/bufdelete.nvim", cmd = "Bdelete" },
  { "numToStr/Comment.nvim", lazy = true },
  { "MunifTanjim/nui.nvim", lazy = false },
  { "dstein64/vim-startuptime", cmd = "StartupTime" },
  -- {
  --   "nvim-treesitter/nvim-treesitter-context",
  --   event = "BufReadPre",
  --   config = true,
  -- },
  {
    "SmiteshP/nvim-navic",
    lazy = false,
    config = function()
      vim.g.navic_silence = true
      require("nvim-navic").setup({ separator = " ", highlight = true, depth_limit = 5 })
    end,
  },
  { "norcalli/nvim-terminal.lua", ft = "terminal", config = true, },
}

return M
