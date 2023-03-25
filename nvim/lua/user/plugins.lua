-- ===================================================================================================================
-- ===================================================================================================================
-- ===================================================================================================================
-- ===================================================================================================================
-- ===================================================================================================================
-- ===================================================================================================================
-- ===================================================================================================================
-- ===================================================================================================================
-- ===================================================================================================================
-- ===================================================================================================================
-- ===================================================================================================================
local fn = vim.fn -- ===================
-- ===================
-- Automatically install packer                                                                 -- ===================
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim" -- ===================
if fn.empty(fn.glob(install_path)) > 0 then -- ===================
	PACKER_BOOTSTRAP = fn.system({ -- ===================
		"git", -- ===================
		"clone", -- ===================
		"--depth", -- ===================
		"1", -- ===================
		"https://github.com/wbthomason/packer.nvim", -- ===================
		install_path, -- ===================
	}) -- ===================
	print("Installing packer close and reopen Neovim...") -- ===================
	vim.cmd([[packadd packer.nvim]]) -- ===================
end -- ===================

-- ===================
-- Autocommand that reloads neovim whenever you save the plugins.lua file                       -- ===================
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use                                      -- ===================
local status_ok, packer = pcall(require, "packer") -- ===================
if not status_ok then -- ===================
	return -- ===================
end -- ===================
-- ===================
-- Have packer use a popup window                                                               -- ===================
packer.init({ -- ===================
	display = {
		-- ===================
		open_fn = function() -- ===================
			return require("packer.util").float({ border = "rounded" }) -- ===================
		end, -- ===================
	}, -- ===================
}) -- ===================
-- ===================================================================================================================
-- ===================================================================================================================
-- ===================================================================================================================
-- ===================================================================================================================
-- ===================================================================================================================
-- ===================================================================================================================
-- ===================================================================================================================
-- ===================================================================================================================
-- ===================================================================================================================
-- ===================================================================================================================
-- ===================================================================================================================
-- ===================================================================================================================
-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used in lots of plugins
	--
	-- Simple plugins can be specified as strings
	use("rstacruz/vim-closer")

	-- Dracula Color Scheme
	--use {'dracula/vim', as = 'dracula'}
	use("Mofiqul/dracula.nvim")

	-- css color highlighter
	use("norcalli/nvim-colorizer.lua")
	-- install without yarn or npm
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-nvim-lsp") -- The completion plugin
	use("hrsh7th/cmp-nvim-lua") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/mason.nvim") -- simple to use language server installer
	use("williamboman/mason-lspconfig.nvim") -- simple to use language server installer
	use("jose-elias-alvarez/null-ls.nvim") -- LSP diagnostics and code actions
	use("williamboman/nvim-lsp-installer")
	use({ "wesleimp/stylua.nvim" })

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use("ahmedkhalf/project.nvim")

	-- Transparency
	use("xiyaowong/nvim-transparent")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- Lsp Signatures
	use({
		"ray-x/lsp_signature.nvim",
	})

  -- Refactoring
  -- Looking for a good one, haven't found yet


	-- Auto Pairs
	use("windwp/nvim-autopairs")

	-- Comments
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Gisigns
	use("lewis6991/gitsigns.nvim")

	-- Nvim Tree
	use("nvim-tree/nvim-tree.lua")
	use("nvim-tree/nvim-web-devicons")

	-- Bufferline
	use("akinsho/bufferline.nvim")
	use("moll/vim-bbye")

	-- Toggle Terminal
	use("akinsho/toggleterm.nvim")

  -- Lua line
  use("nvim-lualine/lualine.nvim")


  -- impatient for fast loading
  use 'lewis6991/impatient.nvim'

	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
-- ===================================================================================================================
-- ===================================================================================================================
-- ===================================================================================================================
-- ===================================================================================================================
-- ===================================================================================================================
-- ===================================================================================================================
-- ===================================================================================================================
-- ===================================================================================================================
-- ===================================================================================================================
-- ===================================================================================================================
-- ===================================================================================================================
-- ===================================================================================================================
