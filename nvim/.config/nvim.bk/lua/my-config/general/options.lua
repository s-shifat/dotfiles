-- :help options
-- Credit: https://github.com/LunarVim/Neovim-from-scratch/blob/01-options/lua/user/options.lua
--
--
--
--
vim.opt.backup = false                          -- creates a backup file
vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
vim.opt.cmdheight = 1                           -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
-- vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.hlsearch = true                         -- highlight all matches on previous search pattern
vim.opt.ignorecase = true                       -- ignore case in search patterns
vim.opt.mouse = "a"                             -- allow the mouse to be used in neovim
vim.opt.pumheight = 10                          -- pop up menu height
vim.opt.showmode = true                         -- display things like -- INSERT --
vim.opt.showtabline = 2                         -- always show tabs
vim.opt.smartcase = true                        -- smart case
vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false                        -- no swapfile
vim.opt.termguicolors = true                    -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 800                        -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = false                        -- enable persistent undo? Nooooooooo!
vim.opt.updatetime = 300                        -- faster completion (4000ms default)
vim.opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.shiftwidth = 2                          -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2                             -- insert 2 spaces for a tab
vim.opt.cursorline = true                       -- highlight the current line
vim.opt.number = true                           -- set numbered lines
vim.opt.relativenumber = true                   -- set relative numbered lines
vim.opt.numberwidth = 2                         -- set number column width to 2 {default 4}
vim.opt.signcolumn =
"yes"                                           -- always show the sign column, otherwise it would shift the text each time
vim.opt.wrap = false                            -- display lines as one long line
vim.opt.virtualedit = "block"                   -- Rectangular selection without limits in virtual mode.
vim.opt.scrolloff = 12                          -- is one of my fav
vim.opt.sidescrolloff = 8
--vim.opt.guifont = "monospace:h17"               -- the font used in graphical neovim applications
vim.opt.spelllang = "en_us" -- Spell checking to english US
vim.opt.spell = false       -- Spell checking enabled
vim.opt.shortmess:append "c"
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
-- vim.cmd [[set shell=/usr/bin/fish]]
-- Set default shell to fish
vim.opt.shell = 'fish'

-- Code folding
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
-- theme DRACULA!!
--vim.cmd[[colorscheme dracula]]


--vim.cmd[[let g:dracula_colorterm = 0]]


-- Builtin Specific

-- -- Nvim tree indent marker
-- lvim.builtin.nvimtree.setup.renderer.indent_markers.enable = true

-- -- Nvim.project
-- lvim.builtin.project.patterns = {
--   -- defaults
--   ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "pyproject.toml",
--   -- Project Specific -> I have my projects under a directory named "projects"
--   ">projects",
--   -- latex specific
--   -- Generally all my latex docs are in "Latex-docs" directory
--   ">Latex-docs",
--   -- "main.tex",
--   -- Python specific
--   -- "main.py", "venv",
-- }



-- -- Telescope search specific
-- lvim.builtin.telescope.defaults.file_ignore_patterns = {
--   -- python-specific
--   "./node%_modules/*",
--   "./.git/*",
--   "lazy%-lock.json",
--   -- python-specific
--   "./poetry.lock",
--   "./ipynb%_checkpoints/*",
--   "./*.ipynb",
--   -- LaTeX specific
--   "main%.aux", "main%.log", "main%.out", "main%.toc", "main%.bbl",
--   "main%.blg", "main%.lof", "main%.lot", "main%.nav", "main%.snm",
--   "main%.fls", "main%.fdb_latexmk", "main%.synctex%.gz"
-- }
