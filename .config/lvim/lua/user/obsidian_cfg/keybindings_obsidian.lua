-- Just a wrapper for which key specific to `obsidian_cfg` only
-- Calling Signature within `obsidian_cfg`:
-- local ileader = require("keybindigs_ide")
-- obsidian_leader["p"] = {"<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Env"}

-- Local Method

local obsidian_leader = lvim.builtin.which_key.mappings

obsidian_leader["o"] = {
  name = "Obsidian",
}

return obsidian_leader["o"]

-- Global Method
-- This will be accessible through out lvim config
--
--
-- IDE_LEADER = lvim.builtin.which_key.mappings

-- IDE_LEADER["i"] = {
--   name = "IDE",
-- }
