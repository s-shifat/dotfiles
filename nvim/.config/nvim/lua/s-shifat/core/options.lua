local opt = vim.opt
local g = vim.g

-- ================================
-- UI SETTINGS
-- ================================
opt.number = true                   -- Show absolute line numbers
opt.relativenumber = true          -- Show relative line numbers for easier navigation
opt.cursorline = true              -- Highlight the current line
opt.signcolumn = "yes"             -- Always show sign column (for LSP, git, etc.)
opt.cmdheight = 1                  -- Minimal command line height
opt.showmode = true                -- Display current mode (e.g., -- INSERT --)
opt.showtabline = 2                -- Always show tabline
opt.termguicolors = true           -- Enable true color support
opt.list = true                    -- Show invisible characters
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }  -- Symbols for whitespace
opt.guicursor = {
  "n-v-c:block",                   -- Normal/Visual/Command: block cursor
  "i-ci-ve:ver25",                -- Insert/Command Insert/Visual Exclusive: vertical bar
  "r-cr:hor20",                   -- Replace modes: horizontal bar
  "o:hor50",                      -- Operator-pending: half-height bar
}
opt.numberwidth = 2                -- Width of the number column

-- ================================
-- INDENTATION (fallback defaults)
-- Sleuth will override these per file
-- ================================
opt.expandtab = true               -- Use spaces instead of tabs
opt.tabstop = 2                    -- Display width of a tab
opt.shiftwidth = 2                 -- Number of spaces for each level of indentation
opt.softtabstop = 2               -- Number of spaces inserted on <Tab>
opt.autoindent = true              -- Maintain indent from previous line
opt.smartindent = true             -- Smart autoindenting on new lines

-- ================================
-- SEARCH SETTINGS
-- ================================
opt.hlsearch = true                -- Highlight matches
opt.ignorecase = true             -- Case-insensitive search...
opt.smartcase = true               -- ...unless capital letters are used

-- ================================
-- FILE & EDITING BEHAVIOR
-- ================================
opt.mouse = "a"                   -- Enable mouse support
opt.clipboard = "unnamedplus"     -- Use system clipboard
opt.fileencoding = "utf-8"        -- File encoding
opt.swapfile = false              -- Disable swap file
opt.backup = false                -- Don't create backup files
opt.writebackup = false           -- No backup when editing files in use
opt.undofile = false              -- Don't keep undo history after closing
opt.confirm = true                -- Confirm instead of error on unsaved changes
opt.scrolloff = 12                -- Minimum lines above/below cursor
opt.sidescrolloff = 8             -- Minimum columns left/right of cursor
opt.wrap = false                  -- Do not wrap long lines
opt.virtualedit = "block"         -- Allow cursor to move freely in visual block mode
opt.pumheight = 10                -- Completion menu max height
opt.timeoutlen = 800              -- Time to wait for a mapped sequence (ms)
opt.updatetime = 300              -- Faster diagnostics/completion updates
opt.completeopt = "menuone,noselect" -- Completion menu behavior
opt.spelllang = "en_us"           -- Spellcheck language
opt.spell = false                 -- Disable spellchecking by default
opt.shell = "fish"                -- Set shell to Fish

-- ================================
-- WINDOW MANAGEMENT
-- ================================
opt.splitbelow = true             -- Horizontal splits go below
opt.splitright = true             -- Vertical splits go to the right

-- ================================
-- MISC
-- ================================
opt.conceallevel = 0              -- Show markdown formatting characters
opt.shortmess:append("c")         -- Don't show completion messages

-- Allow cursor keys to move between lines (wrap around)
vim.cmd("set whichwrap+=<,>,[,],h,l")  
-- ↑ Makes h/l and arrow keys wrap around lines

-- Treat dash-separated words as single words in motions (like 'ciw')
-- vim.cmd([[set iskeyword+=-]])

-- Live preview of :substitute results
opt.inccommand = "split"

-- ================================
-- PLUGIN STARTUP TWEAKS
-- ================================
g.loaded_netrw = 1                -- Disable netrw (I'll likely use nvim-tree or similar)
g.loaded_netrwPlugin = 1


vim.g.have_nerd_font = true
