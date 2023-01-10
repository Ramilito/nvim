return {
  "SmiteshP/nvim-navic",
  -- lazy = false,
  event = "VeryLazy",
  config = function()
    vim.g.navic_silence = true
    require("nvim-navic").setup({ separator = " ", highlight = true, depth_limit = 5 })
  end,
}

