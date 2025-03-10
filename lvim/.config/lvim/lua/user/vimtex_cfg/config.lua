vim.cmd("autocmd BufRead,BufNewFile *.tex set filetype=tex")

local g = vim.g

-- enable Vimtex
g.tex_flavor = 'latex'
g.vimtex_compiler_latexmk = {
  options = {
    '-pdf',
    '-verbose',
    '-file-line-error',
    '-synctex=1',
  }
}
-- g.vimtex_view_method = 'Okular'

-- g.vimtex_view_general_viewer = 'okular'
g.vimtex_view_general_options = '--unique file:@pdf\\#src:@line@tex'
-- set up mappings
-- local map = require('utils').map
-- map('n', '<leader>ll', ':VimtexCompile<CR>', {silent = true})
-- map('n', '<leader>lv', ':VimtexView<CR>', {silent = true})
-- map('n', '<leader>lt', ':VimtexToggle<CR>', {silent = true})
