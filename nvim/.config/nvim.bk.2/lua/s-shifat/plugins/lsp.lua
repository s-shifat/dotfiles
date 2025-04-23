-- s-shifat/plugins/lsp.lua
-- 🧠 Mason + LSP + mason-lspconfig setup

return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",  -- source for LSP completion
      "hrsh7th/nvim-cmp",      -- ✅ missing main completion engine
    },
    config = function()
      require("s-shifat.lsp").setup()
    end,
  },
}
