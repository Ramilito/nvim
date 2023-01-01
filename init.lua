-- vim.api.nvim_create_autocmd("UIEnter", {
--   callback = function()
--     local pid = vim.loop.os_getpid()
--     local ctime = vim.loop.fs_stat("/proc/" .. pid).ctime
--     local start = ctime.sec + ctime.nsec / 1e9
--     local tod = { vim.loop.gettimeofday() }
--     local now = tod[1] + tod[2] / 1e6
--     local startuptime = (now - start) * 1000
--     vim.notify(startuptime .. "ms")
--   end,
-- })

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

-- example using a list of specs with the default options
vim.g.mapleader = " " -- make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = " "

require("lazy").setup("user.plugins")
require("user.keymappings")
require("user.settings")
