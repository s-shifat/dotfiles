lvim.plugins = {

  -- Dracula Colorscheme
  {
    "Mofiqul/dracula.nvim"
  },

  -- Cattpuccin Theme
  { "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
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
  },
  --  [markdown markmap mindmap]
  --  https://github.com/Zeioth/markmap.nvim
  --
  --
  {
    "Zeioth/markmap.nvim",
    build = "yarn global add markmap-cli",
    cmd = { "MarkmapOpen", "MarkmapSave", "MarkmapWatch", "MarkmapWatchStop" },
    opts = {
      html_output = "/tmp/markmap.html", -- (default) Setting a empty string "" here means: [Current buffer path].html
      hide_toolbar = false, -- (default)
      grace_period = 3600000 -- (default) Stops markmap watch after 60 minutes. Set it to 0 to disable the grace_period.
    },
    config = function(_, opts) require("markmap").setup(opts) end
  },


  -- Scientific Notes | Markdown
  {
    "jbyuki/nabla.nvim"

  },

  -- A nice color picker and highlighter
  {
    "uga-rosa/ccc.nvim"
  },

  -- Latex equation display
  {
    'jbyuki/nabla.nvim'
  },

  -- Python IDE: environments
  {
     "AckslD/swenv.nvim"
  },

  -- Python IDE specific
  {
    "stevearc/dressing.nvim"
  },

}
