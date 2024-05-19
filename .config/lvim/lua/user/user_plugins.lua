package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua"

lvim.plugins = {
  {
    "vhyrro/luarocks.nvim",
    priority = 1001, -- this plugin needs to run before anything else
    opts = {
      rocks = { "magick" },
    },
  },
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
  -- {
  --   "kevinhwang91/rnvimr",
  --     cmd = "RnvimrToggle",
  -- },

  -- Symbols Outline | variable explorer
  {
  "simrat39/symbols-outline.nvim",
  },

-- image support for neovim/lvim
  -- To make it work install manually on local system

  {
    "3rd/image.nvim",
    dependencies = { "luarocks.nvim" },
    config = function()
      -- ...
    end
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
  -- Markdown: edit injected language trees with correct filetype in a floating window. 
  {
    'AckslD/nvim-FeMaco.lua',
    config = 'require("femaco").setup()',
  },
  -- Markdown: Create Links, Follow links etc..
  { 'Nedra1998/nvim-mdlink' },

  --- Markdown: Preview inside Lvim
  {
    'MeanderingProgrammer/markdown.nvim',
    name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('render-markdown').setup({})
    end,
  },

  -- Markdown: Auto numbering
  -- {'preservim/vim-markdown'},
  {'bullets-vim/bullets.vim'},

  --- Latex Encoding utility
  {'Konfekt/vim-latexencode'},

  --  Markdown: Mindmap View
  --  [markdown markmap mindmap]
  --  https://github.com/Zeioth/markmap.nvim
  --
  --
  {
    "Zeioth/markmap.nvim",
    -- build = "yarn global add markmap-cli",
    build = "npm install -g markmap-cli",
    cmd = { "MarkmapOpen", "MarkmapSave", "MarkmapWatch", "MarkmapWatchStop" },
    opts = {
      html_output = "/tmp/markmap.html", -- (default) Setting a empty string "" here means: [Current buffer path].html
      hide_toolbar = false, -- (default)
      grace_period = 3600000 -- (default) Stops markmap watch after 60 minutes. Set it to 0 to disable the grace_period.
    },
    config = function(_, opts) require("markmap").setup(opts) end
  },

  -- Markdown: TOC
  {'richardbizik/nvim-toc'},

  -- Markdown: Vim Table Mode
  {'dhruvasagar/vim-table-mode'},

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
  -- {
  --   "christoomey/vim-tmux-navigator"
  -- },

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
