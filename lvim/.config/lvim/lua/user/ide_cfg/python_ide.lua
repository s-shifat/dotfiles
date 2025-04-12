-- -- local formatters = require "lvim.lsp.null-ls.formatters"
-- local formatters = require("none-ls.formatters")

-- -- :Mason Install black
-- formatters.setup { { name = "black" } }

-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup { { command = "ruff", filetypes = { "python" } } }

-- Configure `ruff-lsp`.
-- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ruff_lsp
-- For the default config, along with instructions on how to customize the settings

-- require('swenv').setup({
-- })




-- lvim.builtin.which_key.mappings["C"] = {
--   name = "Python",
--   c = {"<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Env"},
-- }

-- local opts = require("kitty-runner.config").window_config
-- require("kitty-runner").setup(opts)
require("kitty-runner").setup()


local ileader = require("user.ide_cfg.keybindigs_ide")
ileader["p"] = {
  name = "Python",
  e = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Env" },
  s = { "<cmd>SymbolsOutline<cr>", "Symbols Outline" }
}

-- Send code to kitty
local kitty_repl = require("user.ide_cfg.kitty_repl")
local kitty_r = lvim.builtin.which_key.mappings
kitty_r["ks"] = { kitty_repl.OpenKittyWithIPython, "Start Kitty" }
kitty_r["kk"] = {
  mode = {"n", "v"},
  { ":'<,'>KittySendLines<cr>", "Start Kitty" }
}

--
