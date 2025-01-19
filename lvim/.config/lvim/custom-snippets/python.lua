-- Taken from https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key


--  __  __         ____                                 _
-- |  \/  |_   _  |  _ \ ___ _ __ ___  ___  _ __   __ _| |
-- | |\/| | | | | | |_) / _ \ '__/ __|/ _ \| '_ \ / _` | |
-- | |  | | |_| | |  __/  __/ |  \__ \ (_) | | | | (_| | |
-- |_|  |_|\__, | |_|   \___|_|  |___/\___/|_| |_|\__,_|_|
--         |___/
--  ____        _                  _
-- / ___| _ __ (_)_ __  _ __   ___| |_ ___
-- \___ \| '_ \| | '_ \| '_ \ / _ \ __/ __|
--  ___) | | | | | |_) | |_) |  __/ |_\__ \
-- |____/|_| |_|_| .__/| .__/ \___|\__|___/
--               |_|   |_|
--
-- By typing the trigger suggestions will be shown
-- To move between place holders ($1, $2 etc.) use Tab and Shift+Tab
return {

  -- Starter for Data Science Scripts
  s("ds", {
      t({
        "import numpy as np",
        "import pandas as pd",
        "import matplotlib.pyplot as plt",
        "",
        "",
        "df = pd.read_csv(\""
      }), i(1),
      t({ "\")", "" }),
      t({
      "print(df)",
      "print(\"Data Type Information:\")",
      "print(df.info())",
      ""
    }),
    }
  ),

  -- Jupyter NoteBook | Jupynium Specific
  -- Jupynium -> Start Python Code Cell
  s("c", {
      t({
      "# %%",
      ""
      }), i(1),
    }
  ),

  -- Jupynium -> Start Markdown Cell
  s("md", {
      t({
      "# %% [md]",
      "\"\"\"",
      "",
      }), i(1),
      t({
      "",
      "\"\"\"",
    })
    }
  ),
}
