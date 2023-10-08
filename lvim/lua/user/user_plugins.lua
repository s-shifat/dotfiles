lvim.plugins = {

  -- Dracula Colorscheme
  {
    "Mofiqul/dracula.nvim"
  },


  -- Ranger Plugin
  {
    "kevinhwang91/rnvimr",
      cmd = "RnvimrToggle",
  },

  -- Symbols Outline | variable explorer
  {
  "simrat39/symbols-outline.nvim",
  },

  -- Markdown Preview
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },

}
