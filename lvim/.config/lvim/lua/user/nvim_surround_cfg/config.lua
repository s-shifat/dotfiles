-- https://github.com/kylechui/nvim-surround?tab=readme-ov-file
-- The three "core" operations of add/delete/change can be done with the
-- keymaps:
--
--    ys{motion}{char}, 
--
--    ds{char}, and 
--
--    cs{target}{replacement}, respectively. 
--
-- For the following examples, * will denote the cursor positi
--
--     Old text                    Command         New text
-- --------------------------------------------------------------------------------
--     surr*ound_words             ysiw)           (surround_words)
--     *make strings               ys$"            "make strings"
--     [delete ar*ound me!]        ds]             delete around me!
--     remove <b>HTML t*ags</b>    dst             remove HTML tags
--     'change quot*es'            cs'"            "change quotes"
--     <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
--     delete(functi*on calls)     dsf             function calls



require("nvim-surround").setup({
  keymaps = {
    insert = "<C-g>s",
    insert_line = "<C-g>S",
    normal = "sr",
    -- normal_cur = "yss",
    normal_line = "sR",
    -- normal_cur_line = "ySS",
    -- visual = "S",
    -- visual_line = "gS",
    -- delete = "ds",
    -- change = "cs",
    -- change_line = "cS",
  },
})
