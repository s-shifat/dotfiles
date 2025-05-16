  -- See `:help gitsigns` to understand what the configuration keys do

local icons = require("s-shifat.utils.icons")


  return { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = icons.ui.BoldLineLeft },
        change = { text = icons.ui.BoldLineLeft },
        delete = { text = icons.ui.Triangle },
        topdelete = { text = icons.ui.Triangle },
        changedelete = { text = icons.ui.LineVerticalDashed },
        untracked    = { text = icons.ui.LineVerticalDashed },
      },
      signs_staged = {
        add          = { text = icons.ui.BoldLineLeft },
        change       = { text = icons.ui.BoldLineLeft },
        delete       = { text = icons.ui.Triangle },
        topdelete    = { text = icons.ui.Triangle },
        changedelete = { text = icons.ui.LineVerticalDashed },
        untracked    = { text = icons.ui.LineVerticalDashed },
      },
      signs_staged_enable = true,
      attach_to_untracked = true,
    },
  }




        -- add = {
        --   hl = "GitSignsAdd",
        --   text = lvim.icons.ui.BoldLineLeft,
        --   numhl = "GitSignsAddNr",
        --   linehl = "GitSignsAddLn",
        -- },
        -- change = {
        --   hl = "GitSignsChange",
        --   text = lvim.icons.ui.BoldLineLeft,
        --   numhl = "GitSignsChangeNr",
        --   linehl = "GitSignsChangeLn",
        -- },
        -- delete = {
        --   hl = "GitSignsDelete",
        --   text = lvim.icons.ui.Triangle,
        --   numhl = "GitSignsDeleteNr",
        --   linehl = "GitSignsDeleteLn",
        -- },
        -- topdelete = {
        --   hl = "GitSignsDelete",
        --   text = lvim.icons.ui.Triangle,
        --   numhl = "GitSignsDeleteNr",
        --   linehl = "GitSignsDeleteLn",
        -- },
        -- changedelete = {
        --   hl = "GitSignsChange",
        --   text = lvim.icons.ui.BoldLineLeft,
        --   numhl = "GitSignsChangeNr",
        --   linehl = "GitSignsChangeLn",
        -- },

