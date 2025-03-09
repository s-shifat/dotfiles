-- usefull places
-- * https://github.com/LunarVim/LunarVim/issues/2730
-- * https://www.youtube.com/watch?v=ff0GYrK3nT0&list=PLx2ksyallYzW4WNYHD9xOFrPRYGlntAft&index=6

local ts = lvim.builtin.treesitter
ts.textobjects = {
  select = {
    enable = true,
    lookahead = true,
    keymaps = {
      ["ic"] = { query = "@codefence.inner", desc = "Select inside code fence" },
      ["ac"] = { query = "@codefence.outer", desc = "Select around code fence" }
    }
  }

}
