-- Set leader key (optional but common)
vim.g.mapleader = " "

-- Load lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  error("lazy.nvim not installed")
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
require("keymaps")
require("colour")
require("set")
