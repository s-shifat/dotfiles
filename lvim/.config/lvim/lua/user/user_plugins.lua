package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua"

lvim.plugins = {
 { "nvimtools/none-ls.nvim" },
  {
    "vhyrro/luarocks.nvim",
    priority = 1001, -- this plugin needs to run before anything else
    opts = {
      rocks = { "magick" },
    },
  },

  {
    "3rd/image.nvim",
    config = function()
      require("image").setup({
        backend = "kitty", -- Or "kitty" if using Kitty terminal
        integrations = {
          markdown = {
            enabled = true, -- Enables images in Markdown
          },
          neorg = {
            enabled = true, -- Enables images in Neorg
          },
        },
      })
    end,
  },

  -- {
  --   "vhyrro/luarocks.nvim",
  --   priority = 1001, -- this plugin needs to run before anything else
  --   opts = {
  --     rocks = { "magick" },
  --   },
  -- },
  -- Dracula Colorscheme
  {
    "Mofiqul/dracula.nvim"
  },

  -- Cattpuccin Theme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 10000,
    lazy = false
  },



  -- Symbols Outline | variable explorer
  {
    "simrat39/symbols-outline.nvim",
  },


  -- image support for neovim/lvim
  -- To make it work install manually on local system

  -- GitSigns
  {
    "lewis6991/gitsigns.nvim"
  },


  -- Text Objects
  {
    "nvim-treesitter/nvim-treesitter-textobjects",

    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },


  -- Markdown Preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
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
  { 'bullets-vim/bullets.vim' },

  --- Latex Encoding utility
  { 'Konfekt/vim-latexencode' },

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
      hide_toolbar = false,              -- (default)
      grace_period = 3600000             -- (default) Stops markmap watch after 60 minutes. Set it to 0 to disable the grace_period.
    },
    config = function(_, opts) require("markmap").setup(opts) end
  },

  -- Markdown: TOC
  { 'richardbizik/nvim-toc' },

  -- Markdown: Vim Table Mode
  { 'dhruvasagar/vim-table-mode' },

  -- Markdown: Markdown Code Block Evaluation
  { 'jubnzv/mdeval.nvim' },

  -- latex plugin
  -- latexmk needs to be installed
  -- default pdf viewer is onkular
  -- might need it later in tex documents -|
  --  %! tex root: ./main.tex
  {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    ft = "tex",
    -- tag = "v2.15", -- uncomment to pin to a specific release
    config = function()
      vim.cmd("call vimtex#init()")
      vim.g.vimtex_view_general_viewer = 'okular'
      vim.g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]
      vim.g.vimtex_quickfix_enabled = 1
      vim.g.vimtex_syntax_enabled = 1
      vim.g.vimtex_quickfix_mode = 0
    end,
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

  -- Spell checking
  {
    'dpelle/vim-LanguageTool'
  },

  -- Python IDE: environments
  -- {
  --   "AckslD/swenv.nvim"
  -- },
  { "jghauser/kitty-runner.nvim" },

  -- Python IDE specific
  {
    "stevearc/dressing.nvim"
  },

  -- Juypter Notebook Specifics
  -- https://github.com/benlubas/molten-nvim/blob/main/docs/Notebook-Setup.md
  -- Interactive code running with juypter kernel
  -- output imports/exports
  -- {
  --   "benlubas/molten-nvim",
  --   version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
  --   build = ":UpdateRemotePlugins",
  --   init = function()
  --     -- this is an example, not a default. Please see the readme for more configuration options
  --     vim.g.molten_output_win_max_height = 12
  --   end,
  -- },
  {
    "jpalardy/vim-slime"
  },
  -- -- provide lsp features and code completion source
  -- {
  --   'jmbuhr/otter.nvim'
  -- },

  -- -- code cell running
  -- {
  --   'quarto-dev/quarto-nvim',
  --   'jmbuhr/otter.nvim',
  --   'hrsh7th/nvim-cmp',
  --   'neovim/nvim-lspconfig',
  --   'nvim-treesitter/nvim-treesitter'
  -- },

  -- Notebook conversion
  {
    "GCBallesteros/jupytext.nvim",
  },

  -- Easy navigation
  {
    "nvimtools/hydra.nvim"
  },

  {
    "rcarriga/nvim-notify"
  },

  -- Jupyter Notebook Environment
  {
    "kiyoon/jupynium.nvim",
    build = "pip3 install --user .",
    -- build = "conda run --no-capture-output -n jupynium pip install .",
    -- enabled = vim.fn.isdirectory(vim.fn.expand "~/miniconda3/envs/jupynium"),
  },
  {
    'Vigemus/iron.nvim'
  },

  -- Obsidian
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    event = {
      -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
      -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
      "BufReadPre " .. vim.fn.expand "~" .. "/notes/**.md",
      "BufNewFile " .. vim.fn.expand "~" .. "/notes/**.md",
    },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- see below for full list of optional dependencies 👇
    },
    opts = {
      workspaces = {
        {
          name = "notes",
          path = "~/notes",
        }
      },
      -- see below for full list of options 👇
    },
  },

  {
    "dharmx/telescope-media.nvim",
    config = function()
      require("telescope").load_extension("media")
    end,
  },

  -- nvim surround
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
  }



}
