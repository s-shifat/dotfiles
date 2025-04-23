-- s-shifat/plugins/whichkey.lua
-- ✅ Fully compliant with the latest which-key.nvim spec (no :checkhealth warnings)

local icons = require("s-shifat.utils.icons").ui

local wk_setup = {
  plugins = {
    spelling = {
      enabled = true,
      suggestions = 20,
    },
  },
  win = {
    border = "rounded",
  },
  layout = {
    spacing = 4,
    align = "left",
  },
  -- triggers = { "<leader>"},
  triggers = { "<auto>"},
  icons = {
    breadcrumb = icons.DoubleChevronRight, -- symbol used in the command line area that shows your active key combo
    separator = icons.BoldArrowRight, -- symbol used between a key and it's label
    group = icons.Plus, -- symbol prepended to a group
  },

}

        -- name = "Plugins",
        -- i = { "<cmd>Lazy install<cr>", "Install" },
        -- s = { "<cmd>Lazy sync<cr>", "Sync" },
        -- S = { "<cmd>Lazy clear<cr>", "Status" },
        -- c = { "<cmd>Lazy clean<cr>", "Clean" },
        -- u = { "<cmd>Lazy update<cr>", "Update" },
        -- p = { "<cmd>Lazy profile<cr>", "Profile" },
        -- l = { "<cmd>Lazy log<cr>", "Log" },
        -- d = { "<cmd>Lazy debug<cr>", "Debug" },

local groups = {
  { "<leader>l", group = "LSP" },
  { "<leader>s", group = "Search" },
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local vopts = {
  mode = "v", -- VISUAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}


return {
  "folke/which-key.nvim",
  lazy = false,
  priority = 100000,
  config = function()
    local wk = require("which-key")
    wk.setup(wk_setup)
    wk.add(groups, opts, vopts)
  end,
}




