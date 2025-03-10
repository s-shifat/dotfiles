
-- Followed this guide:
-- https://github.com/benlubas/molten-nvim/blob/main/docs/Notebook-Setup.md

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
  -- python_host = "/home/shifat/venvs/venvDS/bin/python3",

  default_notebook_URL = "localhost:8888/nbclassic",

  -- Write jupyter command but without "notebook"
  -- When you call :JupyniumStartAndAttachToServer and no notebook is open,
  -- then Jupynium will open the server for you using this command. (only when notebook_URL is localhost)
  jupyter_command = "jupyter",
  -- jupyter_command = "/home/shifat/venvs/venvDS/bin/jupyter",
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
  -- firefox_profiles_ini_path = nil,
  firefox_profiles_ini_path = '~/.mozilla/firefox/profiles.ini',
  -- nil means the profile with Default=1
  -- or set to something like 'default-release'
  firefox_profile_name = 'jupynium',
  -- To setup as such:
  --  * Open firefox and go to about:profiles
  --  * create a newprofile named 'jupynium'
  --  * Don't make it default
  --  * Now launch this profile and install vimium extension
  --  * close the browser.
  --  * Now In this file make sure firefox_profiles_ini_path and 
  --  firefox_profile_name variables match.

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
      "download_ipynb",
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
local iron = require("iron.core")
local view = require("iron.view")

iron.setup {
  config = {
    -- Whether a repl should be discarded or not
    scratch_repl = true,
    -- Your repl definitions come here
    repl_definition = {
      sh = {
        -- Can be a table or a function that
        -- returns a table (see below)
        command = {"zsh"}
      },
      python = {
        -- command = { "python3" },  -- or { "ipython", "--no-autoindent" }
        command = { "ipython", "--no-autoindent" },
        format = require("iron.fts.common").bracketed_paste_python
      }
    },
    -- How the repl window will be displayed
    -- See below for more information
    -- repl_open_cmd = require('iron.view').bottom(40),
    repl_open_cmd = view.split.vertical.botright(0.40),

    -- repl_open_cmd = "vertical botright 80 split",
  },
  -- Iron doesn't set keymaps by default anymore.
  -- You can set them here or manually add keymaps to the functions in iron.core
  keymaps = {
    send_motion = "<space>rc",
    visual_send = "<space>r",
    send_file = "<space>rf",
    send_line = "<space>r",
    send_paragraph = "<space>sp",
    send_until_cursor = "<space>rul",
    send_mark = "<space>sm",
    mark_motion = "<space>mc",
    mark_visual = "<space>mc",
    remove_mark = "<space>md",
    cr = "<space>s<cr>",
    interrupt = "<space>s<space>",
    exit = "<space>sq",
    clear = "<space>cl",
  },
  -- If the highlight is on, you can change how it looks
  -- For the available options, check nvim_set_hl
  highlight = {
    italic = true
  },
  ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
}

-- -- iron also has a list of commands, see :h iron-commands for all available commands
-- vim.keymap.set('n', '<space>rs', '<cmd>IronRepl<cr>')
-- vim.keymap.set('n', '<space>rr', '<cmd>IronRestart<cr>')
-- vim.keymap.set('n', '<space>rf', '<cmd>IronFocus<cr>')
-- vim.keymap.set('n', '<space>rh', '<cmd>IronHide<cr>')




-- Keybindings
local ileader = require("user.ide_cfg.keybindigs_ide")
ileader["n"] = {
  name = "Jupyter Notebook",
  -- Molten Specific
  -- e = { ":MoltenEvaluateOperator<CR>", "Evaluate operator" },
  -- os = {":noautocmd MoltenEnterOutput<CR>", "Open output window"},
  -- rr = {":MoltenReevaluateCell<CR>", "Re-eval cell"},
  -- rS = {":<C-u>MoltenEvaluateVisual<CR>gv", "Execute visual selection"},
  -- oh = {":MoltenHideOutput<CR>", "Close output window"},
  -- md = {":MoltenDelete<CR>", "Delete Molten cell"},
  -- mx = {":MoltenOpenInBrowser<CR>", "Open Output in Browser"},
  --:JupyniumLoadFromIpynbTabAndStartSync 
  -- Jupynium Specific
  i = {":JupyniumStartAndAttachToServer<CR>", "Start & Attach to Server"},
  s = {":JupyniumLoadFromIpynbTabAndStartSync ", "Start Syncing"},
  e = {":JupyniumExecuteSelectedCells<CR>", "Execute Cell"},
  c = {":JupyniumClearSelectedCellsOutputs<CR>", "Clear Output"},
  t = {":JupyniumToggleSelectedCellsOutputsScroll<CR>", "Toggle Output Scroll"},
  k = {"Kernel Options"},
  kr = {":JupyniumKernelRestart<CR>", "Kernel Restart"},
  ki = {":JupyniumKernelInterrupt<CR>", "Kernel Interrupt"},
  ks = {":JupyniumKernelSelect<CR>", "Kernel Select"},
  h = {":help jupynium.nvim-keybindings<CR>", "Keybinding Help"},
  r = {"IronRepl"},
  rs = {"<cmd>IronRepl<cr>", "Iron Repl"},
  rr = {"<cmd>IronRestart<cr>", "Iron Restart"},
  ro = {"<cmd>IronFocus<cr>", "Focus"},
  rh = {"<cmd>IronHide<cr>", "Iron Hide"},
  ra = {"<cmd>IronAttach<cr>", "Iron Attach"},
  rw = {"<cmd>IronWatch<cr>", "Iron Watch"},
  rl = {iron.send_line, "Run current line"},
  rt = {iron.send_until_cursor, "Run until current line"},
  rq = {iron.exit, "Exit repl"},
  rc = {iron.clear, "Clear repl"},
  rx = {iron.interrupt, "Interrupt repl"},
  rv = {iron.visual_send, "Run Selected lines"},
  rm = {iron.send_motion, "Run Motion"},
  rf = {iron.send_file, "Run File"},
  rp = {iron.send_paragraph, "Run this Block"},

}

