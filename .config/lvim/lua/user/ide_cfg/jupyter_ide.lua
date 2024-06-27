
-- Followed this guide:
-- https://github.com/benlubas/molten-nvim/blob/main/docs/Notebook-Setup.md

-- I find auto open annoying, keep in mind setting this option will require setting
-- a keybind for `:noautocmd MoltenEnterOutput` to open the output again
-- vim.g.molten_auto_open_output = false

-- -- this guide will be using image.nvim
-- -- Don't forget to setup and install the plugin if you want to view image outputs
-- vim.g.molten_image_provider = "image.nvim"

-- -- optional, I like wrapping. works for virt text and the output window
-- vim.g.molten_wrap_output = true

-- -- Output as virtual text. Allows outputs to always be shown, works with images, but can
-- -- be buggy with longer images
-- vim.g.molten_virt_text_output = true

-- -- this will make it so the output shows up below the \`\`\` cell delimiter
-- vim.g.molten_virt_lines_off_by_1 = true


-- Sample Config for quarto-nvim
local quarto = require("quarto")
quarto.setup({
    lspFeatures = {
        -- NOTE: put whatever languages you want here:
        languages = {"python"},
        chunks = "all",
        diagnostics = {
            enabled = true,
            triggers = { "BufWritePost" },
        },
        completion = {
            enabled = true,
        },
    },
    keymap = {
        -- NOTE: setup your own keymaps:
        hover = "jH",
        definition = "jgd",
        rename = "<leader>jrn",
        references = "jgr",
        format = "<leader>jgf",
    },
    codeRunner = {
        enabled = true,
        default_method = "slime",
    },
})

local runner = require("quarto.runner")

local source = {name = "otter"}

table.insert(lvim.builtin.cmp.sources, source)

-- Notebook Conversion
require("jupytext").setup({
    style = "markdown",
    output_extension = "md",
    force_ft = "markdown",
})


vim.g.slime_target = "kitty"



require("jupynium").setup({
  --- For Conda environment named "jupynium",
  -- python_host = { "conda", "run", "--no-capture-output", "-n", "jupynium", "python" },
  python_host = vim.g.python3_host_prog or "python3",

  default_notebook_URL = "localhost:8888/nbclassic",

  -- Write jupyter command but without "notebook"
  -- When you call :JupyniumStartAndAttachToServer and no notebook is open,
  -- then Jupynium will open the server for you using this command. (only when notebook_URL is localhost)
  jupyter_command = "jupyter",
  --- For Conda, maybe use base environment
  --- then you can `conda install -n base nb_conda_kernels` to switch environment in Jupyter Notebook
  -- jupyter_command = { "conda", "run", "--no-capture-output", "-n", "base", "jupyter" },

  -- Used when notebook is launched by using jupyter_command.
  -- If nil or "", it will open at the git directory of the current buffer,
  -- but still navigate to the directory of the current buffer. (e.g. localhost:8888/nbclassic/tree/path/to/buffer)
  notebook_dir = nil,

  -- Used to remember the last session (password etc.).
  -- e.g. '~/.mozilla/firefox/profiles.ini'
  -- or '~/snap/firefox/common/.mozilla/firefox/profiles.ini'
  firefox_profiles_ini_path = nil,
  -- nil means the profile with Default=1
  -- or set to something like 'default-release'
  firefox_profile_name = nil,

  -- Open the Jupynium server if it is not already running
  -- which means that it will open the Selenium browser when you open this file.
  -- Related command :JupyniumStartAndAttachToServer
  auto_start_server = {
    enable = false,
    file_pattern = { "*.ju.*" },
  },

  -- Attach current nvim to the Jupynium server
  -- Without this step, you can't use :JupyniumStartSync
  -- Related command :JupyniumAttachToServer
  auto_attach_to_server = {
    enable = true,
    file_pattern = { "*.ju.*", "*.md" },
  },

  -- Automatically open an Untitled.ipynb file on Notebook
  -- when you open a .ju.py file on nvim.
  -- Related command :JupyniumStartSync
  auto_start_sync = {
    enable = false,
    file_pattern = { "*.ju.*", "*.md" },
  },

  -- Automatically keep filename.ipynb copy of filename.ju.py
  -- by downloading from the Jupyter Notebook server.
  -- WARNING: this will overwrite the file without asking
  -- Related command :JupyniumDownloadIpynb
  auto_download_ipynb = true,

  -- Automatically close tab that is in sync when you close buffer in vim.
  auto_close_tab = true,

  -- Always scroll to the current cell.
  -- Related command :JupyniumScrollToCell
  autoscroll = {
    enable = true,
    mode = "always", -- "always" or "invisible"
    cell = {
      top_margin_percent = 20,
    },
  },

  scroll = {
    page = { step = 0.5 },
    cell = {
      top_margin_percent = 20,
    },
  },

  -- Files to be detected as a jupynium file.
  -- Add highlighting, keybindings, commands (e.g. :JupyniumStartAndAttachToServer)
  -- Modify this if you already have lots of files in Jupytext format, for example.
  jupynium_file_pattern = { "*.ju.*" },

  use_default_keybindings = true,
  textobjects = {
    use_default_keybindings = true,
  },

  syntax_highlight = {
    enable = true,
  },

  -- Dim all cells except the current one
  -- Related command :JupyniumShortsightedToggle
  shortsighted = false,

  -- Configure floating window options
  -- Related command :JupyniumKernelHover
  kernel_hover = {
    floating_win_opts = {
      max_width = 84,
      border = "none",
    },
  },

  notify = {
    ignore = {
      -- "download_ipynb",
      -- "error_download_ipynb",
      -- "attach_and_init",
      -- "error_close_main_page",
      -- "notebook_closed",
    },
  },
})

-- You can link highlighting groups.
-- This is the default (when colour scheme is unknown)
-- Try with CursorColumn, Pmenu, Folded etc.
vim.cmd [[
hi! link JupyniumCodeCellSeparator CursorLine
hi! link JupyniumMarkdownCellSeparator CursorLine
hi! link JupyniumMarkdownCellContent CursorLine
hi! link JupyniumMagicCommand Keyword
]]

-- Please share your favourite settings on other colour schemes, so I can add defaults.
-- Currently, tokyonight is supported.







-- Keybindings
local ileader = require("user.ide_cfg.keybindigs_ide")
ileader["N"] = {
  name = "Jupyter Notebook",
  -- Molten Specific
  -- e = { ":MoltenEvaluateOperator<CR>", "Evaluate operator" },
  -- os = {":noautocmd MoltenEnterOutput<CR>", "Open output window"},
  -- rr = {":MoltenReevaluateCell<CR>", "Re-eval cell"},
  -- rS = {":<C-u>MoltenEvaluateVisual<CR>gv", "Execute visual selection"},
  -- oh = {":MoltenHideOutput<CR>", "Close output window"},
  -- md = {":MoltenDelete<CR>", "Delete Molten cell"},
  -- mx = {":MoltenOpenInBrowser<CR>", "Open Output in Browser"},
  -- Quarto Specific
  c = {runner.run_cell, "Run Cell"},
  a = {runner.run_above, "Run Above"},
  A = {runner.run_all, "Run All Cells"},
  l = {runner.run_line, "Run Line"},
  r = {runner.run_range, "Run Visual Range"},
  X = {
    function ()
      runner.run_all(true)
    end,
    "Run all cells of all languages"
  },
  Q = {require("quarto").activate(), "Activate Quarto"},

}

