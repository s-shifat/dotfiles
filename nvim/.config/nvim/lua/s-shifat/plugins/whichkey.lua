return { -- Useful plugin to show pending keybinds.
    'folke/which-key.nvim',
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },

    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
      -- delay between pressing a key and opening which-key (milliseconds)
      -- this setting is independent of vim.opt.timeoutlen
      delay = 500,
      },
      -- Document existing key chains
      spec = {
        { '<leader>s', group = 'Search' },
        { '<leader>l', group = 'LSP' },
        { '<leader>g', group = 'Git', mode = { 'n', 'v' } },
      }
}
