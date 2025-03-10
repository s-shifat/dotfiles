require("user.ide_cfg.treesitters")
require("user.ide_cfg.keybindigs_ide")

require("user.ide_cfg.python_ide")
require("user.ide_cfg.markdown_ide")
require("user.ide_cfg.latex_ide")
require("user.ide_cfg.jupyter_ide")
require("user.ide_cfg.kitty_repl")


-- Some Personal keybindings
--
-- Applies Asci Text Art effects to selected text
-- make sure `figlet` is installed in path
--  https://github.com/cmatsuoka/figlet
lvim.keys.visual_mode["<leader>art"] = {"!figlet<cr>"}
