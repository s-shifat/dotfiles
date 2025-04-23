-- s-shifat/core/plugins.lua
vim.g.mapleader = " "  -- ✅ this is CRUCIAL
vim.g.maplocalleader = " "

-- Bootstraps lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- -- Plugin setup (modular structure)
-- require("lazy").setup({
--   { import = "s-shifat.plugins" },
-- }, {
--   defaults = {
--     lazy = true, -- Plugins won't load until required
--   },
--   ui = {
--     border = "rounded",
--   },
-- })

-- Setup Lazy and import all plugins under s-shifat/plugins/
require("lazy").setup("s-shifat.plugins", {
  defaults = {
    lazy = true, -- optional: make plugins lazy-loaded by default
  },
  ui = {
    border = "rounded",
  },
})
