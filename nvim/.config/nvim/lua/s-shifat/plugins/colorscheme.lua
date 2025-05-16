return {
	{
		"xiyaowong/nvim-transparent",
		lazy = false,
		priority = 999,
	},
-- s-shifat/plugins/colorscheme.lua
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 10000,
    lazy = false,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- or "latte", "frappe", "macchiato"
        integrations = {
          treesitter = true,
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          telescope = true,
          markdown = true,
          which_key = true,
        },
      })
    vim.cmd.colorscheme("catppuccin")
    end,
  },
}

