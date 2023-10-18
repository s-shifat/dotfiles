lvim.plugins = {

  -- Dracula Colorscheme
  {
    "Mofiqul/dracula.nvim"
  },


  -- Ranger Plugin
  {
    "kevinhwang91/rnvimr",
      cmd = "RnvimrToggle",
  },

  -- Symbols Outline | variable explorer
  {
  "simrat39/symbols-outline.nvim",
  },

  -- Markdown Preview
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },

  -- Latex plugin
  -- latexmk needs to be installed
  -- default pdf viewer is onkular
  -- Might need it later in tex documents -|
  --  %! TeX root: ./main.tex
  {
    'lervag/vimtex'
  },

  -- gitignore generator
  {
    "wintermute-cell/gitignore.nvim"
  },

  -- vim tmux navigator
  {
    "christoomey/vim-tmux-navigator"
  }

}
