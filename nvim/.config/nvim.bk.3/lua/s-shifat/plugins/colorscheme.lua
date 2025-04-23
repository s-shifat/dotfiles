-- s-shifat/plugins/colorscheme.lua

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
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


