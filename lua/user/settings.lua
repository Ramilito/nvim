vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false

vim.o.ignorecase = true
vim.o.smartcase = true
-- vim.g.loaded_netrwPlugin = 1
-- vim.g.loaded_netrw = 1

-- Set colorscheme
vim.o.termguicolors = true
-- vim.cmd [[ colorscheme tokyonight-night ]]
-- vim.cmd [[ colorscheme catppuccin ]]

-- vim.o.clipboard = 'unnamedplus'

-- if vim.fn.has "wsl" == 1 then
--   vim.g.clipboard = {
--     name = "win32yank-wsl",
--     copy = {
--       ["+"] = "win32yank.exe -i --crlf",
--       ["*"] = "win32yank.exe -i --crlf",
--     },
--     paste = {
--       ["+"] = "win32yank.exe -o --lf",
--       ["*"] = "win32yank.exe -o --lf",
--     },
--     cache_enabled = 0,
--   }
-- end

-- Undotree
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
vim.opt.undofile = true
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.showtabline = 0
vim.opt.laststatus = 3
vim.opt.cmdheight = 1

vim.opt.scrolloff = 8
vim.opt.updatetime = 50
vim.opt.timeoutlen = 1000
vim.opt.signcolumn = "yes"


vim.api.nvim_create_autocmd({ "CursorMoved", "VimEnter", "BufWinEnter" }, {
  callback = function()
    local winbar_filetype_exclude = {
      "help",
      "startify",
      "dashboard",
      "packer",
      "neo-tree",
      "neogitstatus",
      "NvimTree",
      "Trouble",
      "alpha",
      "lir",
      "Outline",
      "spectre_panel",
      "toggleterm",
      "TelescopePrompt",
      "prompt",
    }

    if vim.tbl_contains(winbar_filetype_exclude, vim.bo.filetype) then
      vim.opt_local.winbar = nil
      return
    end

    local win_number = vim.api.nvim_get_current_win()
    local config = vim.api.nvim_win_get_config(win_number)

    if config.relative == "" then
      vim.opt_local.winbar = "%{%v:lua.require'user.winbar'.get_winbar()%}"
    else
      vim.opt_local.winbar = nil
    end
  end,
})

