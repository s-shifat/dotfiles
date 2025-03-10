lvim.builtin.treesitter.ensure_installed = {
  "python",
  "latex",
  "lua",
}

lvim.builtin.treesitter.highlight.enable = true


vim.cmd [[
    augroup NvimTreeHighlight
      autocmd!
      autocmd BufEnter *.tex :setfiletype tex
    augroup END
]]
