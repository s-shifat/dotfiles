return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 10000, -- Ensure it loads first
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- Options: latte, frappe, macchiato, mocha
        integrations = {
          nvimtree = true,
          treesitter = true,
          lsp_trouble = true,
          telescope = true,
          which_key = true,
        },
      })
      vim.cmd.colorscheme "catppuccin-mocha"
    end,
}
