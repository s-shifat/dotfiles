-- Credit: https://github.com/LunarVim/Neovim-from-scratch

-- Keymap options
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name for legacy compatibility
local keymap = vim.api.nvim_set_keymap

-- ======================================
-- Leader Key Setup
-- ======================================
keymap("", "<Space>", "<Nop>", opts)           -- Disable space by default
vim.g.mapleader = " "                          -- Global leader key
vim.g.maplocalleader = " "                     -- Local leader key

-- ======================================
-- General Keymaps
-- ======================================
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save current buffer" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit Neovim" })
vim.keymap.set("n", "<leader>c", "<cmd>bd<CR>", { desc = "Close current buffer" })
vim.keymap.set("n", "<leader>h", "<cmd>noh<CR>", { desc = "Clear search highlights" })

-- ======================================
-- Window Navigation
-- ======================================
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Resize Splits
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Buffer Navigation
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- ======================================
-- Insert Mode
-- ======================================
keymap("i", "jj", "<ESC>", opts)               -- Quickly exit insert mode

-- ======================================
-- Visual Mode
-- ======================================
keymap("v", "<", "<gv", opts)                  -- Indent left and stay in mode
keymap("v", ">", ">gv", opts)                  -- Indent right and stay in mode
keymap("v", "<A-j>", ":m .+1<CR>==", opts)     -- Move line down
keymap("v", "<A-k>", ":m .-2<CR>==", opts)     -- Move line up
keymap("v", "p", '"_dP', opts)                 -- Paste without yanking replaced text

-- ======================================
-- Visual Block Mode
-- ======================================
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- ======================================
-- Terminal Mode (using keymap.set to avoid LSP issues)
-- ======================================
vim.keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
vim.keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
vim.keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- ======================================
-- Plugin-specific Keymaps (Uncomment as needed)
-- ======================================

-- Telescope
-- keymap("n", "<leader>f", ":Telescope find_files<CR>", opts)
-- keymap("n", "<leader>lg", ":Telescope live_grep<CR>", opts)

-- Gitsigns
-- keymap("n", "<leader>gj", ":Gitsigns next_hunk<CR>", opts)
-- keymap("n", "<leader>gk", ":Gitsigns prev_hunk<CR>", opts)
-- keymap("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", opts)

-- NvimTree
-- keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Format (null-ls / LSP)
-- keymap("n", "<leader>/", ":lua vim.lsp.buf.format()<CR>", opts)

-- Toggle Terminal
-- keymap("n", "<leader>t", ":ToggleTerm size=10 direction=horizontal<CR>", opts)

-- Symbols Outline
-- keymap("n", "<leader>ve", ":SymbolsOutline<CR>", opts)
