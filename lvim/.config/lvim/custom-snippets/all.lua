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
  -- A snippet that expands the trigger "hi" into the
  -- string "Hello, world"
  s(
    { trig = "hi" },
    { t("Hello, world") }
  ),

  -- string "Hello, world"
  s(
    { trig = "yo" },
    { t("yooo") }
  ),
  s("trigger", {
    t({ "After expanding, the cursor is here ->" }), i(1),
    t({ "Ami", "After jumping forward once, cursor is here ->", "Eikhane:" }), i(2),
    t({ "Theke     Jibon", "After jumping once more, the snippet is exited there ->" }), i(0),
  })
}
