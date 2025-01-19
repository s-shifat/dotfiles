-- Just a wrapper for which key specific to `ide_cfg` only
-- Calling Signature within `ide_cfg`:
-- local ileader = require("keybindigs_ide")
-- ileader["p"] = {"<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Env"}

-- Local Method

local ide_leader = lvim.builtin.which_key.mappings

ide_leader["i"] = {
  name = "IDE",
}

return ide_leader["i"]

-- Global Method
-- This will be accessible through out lvim config
--
--
-- IDE_LEADER = lvim.builtin.which_key.mappings

-- IDE_LEADER["i"] = {
--   name = "IDE",
-- }
