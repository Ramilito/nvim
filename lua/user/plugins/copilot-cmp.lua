local M = {
  "zbirenbaum/copilot-cmp",
  event = "VeryLazy",
  dependencies = {
    "copilot.lua"
  }
}

function M.config()
  require("copilot_cmp").setup()
end

return M
