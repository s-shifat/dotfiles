-- credit: https://github.com/LunarVim/Neovim-from-scratch/blob/02-keymaps/lua/user/keymaps.lua
--
--
--
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",


-- Exiting Neovim
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save current buffer" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit Nvim" })
vim.keymap.set("n", "<leader>c", "<cmd>bd<CR>", { desc = "Quit current buffer" })


-- Normal --
--
--
-- Better window navigation using Ctrl + hjkl
vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true })

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- -- File explorer to left
-- keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
-- keymap("n", "<leader>bd", ":bd<CR>", opts)
-- keymap("n", "<leader>wq", ":Bdelete<CR>", opts)
-- :bd to close current buffer

-- Insert --
-- Press jj fast to enter
keymap("i", "jj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move Selected text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move selected block up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Plugin specific keymaps --

-- Telescope --
-- keymap("n", "<leader>f", ":Telescope find_files<CR>", opts)
-- keymap("n", "<leader>lg", ":Telescope live_grep<CR>", opts)

-- Gitsigns --
-- keymap("n", "<leader>gj", ":Gitsigns next_hunk<CR>", opts)
-- keymap("n", "<leader>gk", ":Gitsigns prev_hunk<CR>", opts)
-- keymap("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", opts)

-- NVIM TREE File explorer to left
-- keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Null-Ls | formatter
-- keymap("n", "<leader>/", ":lua vim.lsp.buf.format()<CR>", opts)

-- Toggle Terminal
-- keymap("n", "<leader>t", ":ToggleTerm size=10 direction=horizontal<CR>", opts)
-- lvim.builtin.which_key.mappings["t"] = {
-- "<cmd>ToggleTerm size=10 direction=horizontal<CR>", "Terminal"
-- }

-- Symbols Outline
keymap("n", "<leader>ve", ":SymbolsOutline<CR>", opts)




-- Nvim tree setup
-- Safe mapping for NvimTree keybinds
-- local ok, api = pcall(require, "nvim-tree.api")
-- if ok then
-- Toggle nvim-tree
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })

-- Focus on nvim-tree (optional)
vim.keymap.set("n", "<leader>fe", "<cmd>NvimTreeFocus<CR>", { desc = "Focus File Explorer" })

-- Refresh the tree
vim.keymap.set("n", "<leader>fr", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh File Tree" })
