local function project_files()
  local opts = {}
  if vim.loop.fs_stat(".git") then
    opts.show_untracked = true
    require("telescope.builtin").git_files(opts)
  else
    local client = vim.lsp.get_active_clients()[1]
    if client then
      opts.cwd = client.config.root_dir
    end
    require("telescope.builtin").find_files(opts)
  end
end

local M = {
  "nvim-telescope/telescope.nvim",
  cmd = { "Telescope" },
  lazy = true,
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  keys = {
    { "<leader><space>", project_files, desc = "Find File" },
    { "<leader>sf", "<cmd> Telescope find_files <CR>", desc = "Search Files" },
    { "<leader>sa", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", desc = "Search All" },
    { "<leader>st", "<cmd> Telescope live_grep <CR>", desc = "Live Grep" },
    { "<leader>sb", "<cmd> Telescope buffers <CR>", desc = "Find Buffers" },
    { "<leader>sh", "<cmd> Telescope help_tags <CR>", desc = "Help Page" },
    { "<leader>sr", "<cmd> Telescope oldfiles <CR>", desc = "Search Recent" },
    { "<leader>sk", "<cmd> Telescope keymaps <CR>", desc = "Show Keys" },
  },
}

function M.config()
  local actions = require("telescope.actions")
  local telescope = require("telescope")
  local borderless = true
  telescope.setup({
    defaults = {
      layout_strategy = "horizontal",
      layout_config = {
        prompt_position = "top",
      },
      sorting_strategy = "ascending",
      mappings = {
        i = {
          ["<c-t>"] = function(...)
            return require("trouble.providers.telescope").open_with_trouble(...)
          end,
          ["<C-Down>"] = function(...)
            return require("telescope.actions").cycle_history_next(...)
          end,
          ["<C-Up>"] = function(...)
            return require("telescope.actions").cycle_history_prev(...)
          end,
        },
      },
      prompt_prefix = " ",
      selection_caret = " ",
      winblend = borderless and 0 or 10,
    },
  })

  telescope.load_extension("fzf")
end

return M
