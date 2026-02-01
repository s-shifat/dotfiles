return {
  "lervag/vimtex",
  lazy = false,     -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
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

    -- Zathura is actually cool and faster than Okular!
    -- But setup zathura correctly
    -- sudo pacman -Syy
    -- sudo pacman -S zathura
    -- sudo pacman -S mupdf
    -- sudo pacman -S zathura-pdf-mupdf



    g.vimtex_view_method = "zathura"
    g.vimtex_view_general_options = '--unique file:@pdf\\#src:@line@tex'
    -- set up mappings
    -- local map = require('utils').map
    -- map('n', '<leader>ll', ':VimtexCompile<CR>', {silent = true})
    -- map('n', '<leader>lv', ':VimtexView<CR>', {silent = true})
    -- map('n', '<leader>lt', ':VimtexToggle<CR>', {silent = true})
  end
}
