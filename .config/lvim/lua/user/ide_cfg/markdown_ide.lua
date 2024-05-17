-- https://medium.com/@chrisatmachine/lunarvim-improve-markdown-editing-with-marksman-739d06c73a26
-- Setup LSP
require("lvim.lsp.manager").setup("marksman")


-- Nabla Keybindings for 
-- local nabla_shortcut = "lua require'nabla'.enable_virt()"



-- Set the Keybindings

local ileader = require("user.ide_cfg.keybindigs_ide")

ileader["m"] = {
  name = "Markdown",
  s = {'<cmd>lua require"nabla".toggle_virt()<cr>', "Scientific Equation Preview"},
  p = {'<cmd>MarkdownPreviewToggle<cr>', "Preview Markdown"},
}


