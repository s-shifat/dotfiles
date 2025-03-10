-- Set the Keybindings

local ileader = require("user.ide_cfg.keybindigs_ide")
require("lvim.lsp.manager").setup("texlab")

ileader["l"] = {
  name = "LaTeX",
  p = {'<cmd>VimtexCompile<cr>', "Compile and Preview Documnet"},
  x = {'<cmd>VimtexStop<cr>', "Stop vimtex"},
  X = {'<cmd>VimtexStopAll<cr>', "Stop ALL vimtex"},
  c = {'<cmd>VimtexClean<cr>', "Clean Directory"},
  w = {'<cmd>VimtexCountWords<cr>', "Count Words"},
  l = {'<cmd>VimtexCountLetters<cr>', "Count Letters"},
  s = {'<cmd>VimtexImapsList<cr>', "Math Symbols List"},
  r = {'<cmd>VimtexReload<cr>', "Vimtex Reload"},
  t = {'<cmd>VimtexTocToggle<cr>', "TOC Toggle"},
  v = {'<cmd>VimtexView<cr>', "View Current Line"},
}
