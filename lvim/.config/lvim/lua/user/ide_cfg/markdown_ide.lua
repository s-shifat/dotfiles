

-- Auto Numbering
-- Bullets.vim
-- https://github.com/bullets-vim/bullets.vim
-- <c-t> Go In
-- <c-d> Go Out
vim.g.bullets_enabled_file_types = {
  'markdown',
  'text',
  'gitcommit',
  'scratch'
}




-- https://medium.com/@chrisatmachine/lunarvim-improve-markdown-editing-with-marksman-739d06c73a26
-- Setup LSP
require("lvim.lsp.manager").setup("marksman")

-- Set the Keybindings


-- Settings for Lvim Markdown Privew
require('render-markdown').setup({
    -- Configure whether Markdown should be rendered by default or not
    -- start_enabled = true,
    start_enabled = true,
    -- Maximum file size (in MB) that this plugin will attempt to render
    -- Any file larger than this will effectively be ignored
    max_file_size = 1.5,
    -- Capture groups that get pulled from markdown
    markdown_query = [[
        (atx_heading [
            (atx_h1_marker)
            (atx_h2_marker)
            (atx_h3_marker)
            (atx_h4_marker)
            (atx_h5_marker)
            (atx_h6_marker)
        ] @heading)

        (thematic_break) @dash

        (fenced_code_block) @code

        [
            (list_marker_plus)
            (list_marker_minus)
            (list_marker_star)
        ] @list_marker

        (task_list_marker_unchecked) @checkbox_unchecked
        (task_list_marker_checked) @checkbox_checked

        (block_quote (block_quote_marker) @quote_marker)
        (block_quote (paragraph (inline (block_continuation) @quote_marker)))

        (pipe_table) @table
        (pipe_table_header) @table_head
        (pipe_table_delimiter_row) @table_delim
        (pipe_table_row) @table_row
    ]],
    -- Capture groups that get pulled from inline markdown
    inline_query = [[
        (code_span) @code
    ]],
    -- The level of logs to write to file: vim.fn.stdpath('state') .. '/render-markdown.log'
    -- Only intended to be used for plugin development / debugging
    log_level = 'error',
    -- Filetypes this plugin will run on
    file_types = { 'markdown' },
    -- Vim modes that will show a rendered view of the markdown file
    -- All other modes will be uneffected by this plugin
    render_modes = { 'n', 'c' },
    -- Characters that will replace the # at the start of headings
  --    󰬺 
    -- headings = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
    headings = { ' ', ' ', ' ', '', ' ', ' ' },
    -- Character to use for the horizontal break
    dash = '—',
    -- Character to use for the bullet points in lists
    bullets = { '●    ', '○    ', '◆    ', '◇    ' },
    checkbox = {
        -- Character that will replace the [ ] in unchecked checkboxes
        unchecked = ' ',
        -- Character that will replace the [x] in checked checkboxes
        -- checked = ' ⊏⊐ |_  ',
        checked = ' ',
    },
    -- Character that will replace the > at the start of block quotes
    quote = '┃',
    -- See :h 'conceallevel' for more information about meaning of values
    conceal = {
        -- conceallevel used for buffer when not being rendered, get user setting
        default = vim.opt.conceallevel:get(),
        -- conceallevel used for buffer when being rendered
        rendered = 3,
        -- rendered = 0,
    },
    -- Add a line above and below tables to complete look, ends up like a window
    fat_tables = true,
    -- Define the highlight groups to use when rendering various components
    highlights = {
        heading = {
            -- Background of heading line
            backgrounds = { 'DiffAdd', 'DiffChange', 'DiffDelete' },
            -- Foreground of heading character only
            foregrounds = {
                'markdownH1',
                'markdownH2',
                'markdownH3',
                'markdownH4',
                'markdownH5',
                'markdownH6',
            },
        },
        -- Horizontal break
        dash = 'LineNr',
        -- Code blocks
        code = 'ColorColumn',
        -- Bullet points in list
        bullet = 'Normal',
        checkbox = {
            -- Unchecked checkboxes
            unchecked = '@markup.list.unchecked',
            -- Checked checkboxes
            checked = '@markup.heading',
        },
        table = {
            -- Header of a markdown table
            head = '@markup.heading',
            -- Non header rows in a markdown table
            row = 'Normal',
        },
        -- LaTeX blocks
        latex = '@markup.math',
        -- latex = false,
        -- Quote character in a block quote
        quote = '@markup.quote',
    },
})


-- Link Management
-- Keybinding	Description
-- <CR>	Follow the link under the cursor, or create a new link
-- <BS>	After following a link, go back to the previous file
require('nvim-mdlink').setup({
  keymap = true,
  cmp = true
})


-- Generate TOC
require("nvim-toc").setup({
  toc_header = "Table of Contents"
})


-- -- Show image under cursor
local function image_at_cursor_only()
  require("image").setup({
    integrations = {
      markdown = {
        only_render_image_at_cursor = true,
      },
    },
  })
end


-- Show image in whole document
local function show_image_full_doc()
  require("image").setup({
    integrations = {
      markdown = {
        only_render_image_at_cursor = false,
      },
    },
  })
end

-- Preview in Lvim
local function render_document()
  require('render-markdown').toggle()
  show_image_full_doc()
  require"nabla".toggle_virt()
end
--
--
--
--
-- Evaluate code blocks!

require 'mdeval'.setup({
  -- Don't ask before executing code blocks
  require_confirmation=false,
  -- Change code blocks evaluation options.
  eval_options = {
    -- Set custom configuration for C++
    cpp = {
      command = {"clang++", "-std=c++20", "-O0"},
      default_header = [[
    #include <iostream>
    #include <vector>
    using namespace std;
      ]]
    },
    -- Add new configuration for Racket
    racket = {
      command = {"racket"},        -- Command to run interpreter
      language_code = "racket",    -- Markdown language code
      exec_type = "interpreted",   -- compiled or interpreted
      extension = "rkt",           -- File extension for temporary files
    },
    python = {
      command = {"$HOME/venvs/venvDS/bin/python"},        -- Command to run interpreter
      language_code = "python",    -- Markdown language code
      exec_type = "interpreted",   -- compiled or interpreted
      extension = "py",           -- File extension for temporary files
    },
  },
})
vim.g.markdown_fenced_languages = {'python', 'cpp'}


-- Code Cells with lsp
-- local otter = require'otter'
-- otter.setup{
--   lsp = {
--     hover = {
--       border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
--     },
--     -- `:h events` that cause the diagnostics to update. Set to:
--     -- { "BufWritePost", "InsertLeave", "TextChanged" } for less performant
--     -- but more instant diagnostic updates
--     diagnostic_update_events = { "BufWritePost" },
--   },
--   buffers = {
--     -- if set to true, the filetype of the otterbuffers will be set.
--     -- otherwise only the autocommand of lspconfig that attaches
--     -- the language server will be executed without setting the filetype
--     set_filetype = false,
--     -- write <path>.otter.<embedded language extension> files
--     -- to disk on save of main buffer.
--     -- usefule for some linters that require actual files
--     -- otter files are deleted on quit or main buffer close
--     write_to_disk = false,
--   },
--   strip_wrapping_quote_characters = { "'", '"', "`" },
--   -- Otter may not work the way you expect when entire code blocks are indented (eg. in Org files)
--   -- When true, otter handles these cases fully. This is a (minor) performance hit
--   handle_leading_whitespace = false,
-- }

-- --
-- -- table of embedded languages to look for.
-- -- default = nil, which will activate
-- -- any embedded languages found
-- local languages = {'python', 'lua' }

-- -- enable completion/diagnostics
-- -- defaults are true
-- local completion = true
-- local diagnostics = true
-- -- treesitter query to look for embedded languages
-- -- uses injections if nil or not set
-- local tsquery = nil

-- otter.activate(languages, completion, diagnostics, tsquery)

-- Keybindings

local ileader = require("user.ide_cfg.keybindigs_ide")

ileader["m"] = {
  name = "Markdown",
  s = {'<cmd>lua require"nabla".toggle_virt()<cr>', "Scientific Equation Preview"},

  p = {'<cmd>MarkdownPreviewToggle<cr>', "Preview Markdown"},
  P = {'<cmd>RenderMarkdownToggle<cr>', "Preview Inside LVIM"},
  -- P = {render_document, "Preview Inside LVIM"},

  c = {'<cmd>FeMaco<cr>', "Edit Code Cells with lsp"},

  -- i = {show_image_full_doc, "Show Image"},
  -- I = {image_at_cursor_only, "Show image at cursor only"},

  m = {"Mindmap"},
  mp = {'<cmd>MarkmapWatch<cr>', "View as Mindmap"},
  mx = {'<cmd>MarkmapWatchStop<cr>', "Stop Mindmap server"},
  ms = {'<cmd>MarkmapSave<cr>', "Save Mindmap"},

  t = {"<cmd>TableModeToggle<cr>", "Table Mode"},

  T = {"Table of Content"},
  Tn = {"<cmd>TOC<cr>", "Numbered TOC"},
  Tl = {"<cmd>TOCList<cr>", "List TOC"},

  r = {"<cmd>lua require 'mdeval'.eval_code_block()<CR>", "Execute Cell"}
}
