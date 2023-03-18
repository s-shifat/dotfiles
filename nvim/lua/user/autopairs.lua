--require('nvim-autopairs').setup({
--  disable_filetype = { "TelescopePrompt", "spectre_panel", "vim" },
--  disable_in_macro = false,  -- disable when recording or executing a macro,
--  disable_in_visualblock = false, -- disable when insert after visual block mode
--  disable_in_replace_mode = true,
--  ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
--  enable_moveright = true,
--  enable_afterquote = true,  -- add bracket pairs after quote,
--  enable_check_bracket_line = true,  --- check bracket in same line
--  enable_bracket_in_quote = true, --
--  enable_abbr = false, -- trigger abbreviation
--  break_undo = true, -- switch for basic rule break undo sequence
--  check_ts = false,
--  map_cr = true,
--  map_bs = true, -- map the <BS> key
--  map_c_h = false,  -- Map the <C-h> key to delete a pair
--  map_c_w = false, -- map <c-w> to delete a pair if possible
--})
--
--
--
--
--
-- Not Working:
--  Before        Input         After
--  ------------------------------------
--  {|}           <CR>          {
--                                  |
--                              }
--  -------------------------------------
--  
--  map_cr = false,
--
--
--
--
-- Setup nvim-cmp.
local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
  return
end

npairs.setup {
  check_ts = true,
  ts_config = {
    lua = { "string", "source" },
    javascript = { "string", "template_string" },
    java = false,
  },
  disable_filetype = { "TelescopePrompt", "spectre_panel" },
  disable_in_macro = false,  -- disable when recording or executing a macro
  disable_in_visualblock = false, -- disable when insert after visual block mode
  disable_in_replace_mode = true,
  ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
  enable_moveright = true,
  enable_afterquote = true,  -- add bracket pairs after quote
  enable_check_bracket_line = true,  --- check bracket in same line
  enable_bracket_in_quote = true, --
  enable_abbr = false, -- trigger abbreviation
  break_undo = true, -- switch for basic rule break undo sequence
  map_cr = false, -- ISSUE: setting true is adding extra closing bracket --
  map_bs = true, -- map the <BS> key
  map_c_h = false,  -- Map the <C-h> key to delete a pair
  map_c_w = false, -- map <c-w> to delete a pair if possible
  fast_wrap = {
    map = "<M-e>",
    chars = { "{", "[", "(", '"', "'" },
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
    offset = 0, -- Offset from pattern match
    end_key = "$",
    keys = "qwertyuiopzxcvbnmasdfghjkl",
    check_comma = true,
    highlight = "PmenuSel",
    highlight_grey = "LineNr",
  },
}


local cmp_autopairs = require "nvim-autopairs.completion.cmp"
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local handlers = require('nvim-autopairs.completion.handlers')

cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done({
    filetypes = {
      -- "*" is a alias to all filetypes
      ["*"] = {
        ["("] = {
          kind = {
            cmp.lsp.CompletionItemKind.Function,
            cmp.lsp.CompletionItemKind.Method,
          },
          handler = handlers["*"]
        }
      },
      lua = {
        ["("] = {
          kind = {
            cmp.lsp.CompletionItemKind.Function,
            cmp.lsp.CompletionItemKind.Method
          },
          ---@param char string
          ---@param item table item completion
          ---@param bufnr number buffer number
          ---@param rules table
          ---@param commit_character table<string>
          handler = function(char, item, bufnr, rules, commit_character)
            -- Your handler function. Inpect with print(vim.inspect{char, item, bufnr, rules, commit_character})
          end
        }
      },
      -- Disable for tex
      tex = false
    }
  })
)
