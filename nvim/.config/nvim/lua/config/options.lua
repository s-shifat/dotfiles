local opt = vim.opt

-- 2 spaces for each indentation
opt.shiftwidth = 4
-- insert 2 spaces for tab while editing
opt.softtabstop = 4
opt.completeopt = "menuone,noselect" -- for autocomplete which we'll be doing in the future
opt.autoindent = true -- auto indent when using `o` or `O`
opt.conceallevel = 0 -- to show text normally
opt.guicursor = {
  "n-v-c:block",     -- Normal, Visual, Command: block cursor
  "i-ci-ve:ver25",   -- Insert, Command Insert, Visual Exclusive: thin vertical bar
  "r-cr:hor20",      -- Replace modes: horizontal bar
  "o:hor50",         -- Operator-pending: half-height block
}

opt.backup = false                          -- creates a backup file
opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
opt.cmdheight = 1                           -- more space in the neovim command line for displaying messages
opt.fileencoding = "utf-8"                  -- the encoding written to a file
opt.hlsearch = true                         -- highlight all matches on previous search pattern
opt.ignorecase = true                       -- ignore case in search patterns
opt.mouse = "a"                             -- allow the mouse to be used in neovim
opt.pumheight = 10                          -- pop up menu height
opt.showmode = true                         -- display things like -- INSERT --
opt.showtabline = 2                         -- always show tabs
opt.smartcase = true                        -- smart case
opt.smartindent = true                      -- make indenting smarter again
opt.splitbelow = true                       -- force all horizontal splits to go below current window
opt.splitright = true                       -- force all vertical splits to go to the right of current window
opt.swapfile = false                        -- no swapfile
opt.termguicolors = true                    -- set term gui colors (most terminals support this)
opt.timeoutlen = 800                        -- time to wait for a mapped sequence to complete (in milliseconds)
opt.undofile = false                        -- enable persistent undo? Nooooooooo!
opt.updatetime = 300                        -- faster completion (4000ms default)
opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
opt.expandtab = true                        -- convert tabs to spaces
opt.shiftwidth = 2                          -- the number of spaces inserted for each indentation
opt.tabstop = 2                             -- insert 2 spaces for a tab
opt.cursorline = true                       -- highlight the current line
opt.number = true                           -- set numbered lines
opt.relativenumber = true                   -- set relative numbered lines
opt.numberwidth = 2                         -- set number column width to 2 {default 4}
opt.signcolumn = "yes"                                           -- always show the sign column, otherwise it would shift the text each time
opt.wrap = false                            -- display lines as one long line
opt.virtualedit = "block"                   -- Rectangular selection without limits in virtual mode.
opt.scrolloff = 12                          -- is one of my fav
opt.sidescrolloff = 8
--opt.guifont = "monospace:h17"               -- the font used in graphical neovim applications
opt.spelllang = "en_us" -- Spell checking to english US
opt.spell = false       -- Spell checking enabled
opt.shortmess:append "c"
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
-- vim.cmd [[set shell=/usr/bin/fish]]
-- Set default shell to fish
opt.shell = 'fish'

-- Code folding
-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- folds
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99
