-- s-shifat/plugins/nvimtree.lua
-- 📁 NvimTree file explorer config
--
-- 🛠️ Requirements on Arch:
--   1. Nerd Font enabled in your terminal (e.g., JetBrainsMono Nerd Font)
--      Download from https://www.nerdfonts.com/ and enable in Kitty config:
--        font_family JetBrainsMono Nerd Font
--



return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle File Explorer" },
    },
    config = function()
      require("nvim-tree").setup({
        view = {
          width = 30,
          side = "left",
          preserve_window_proportions = true,
        },
        renderer = {
          indent_markers = {
            enable = true, -- 📌 like in LunarVim
          },
          icons = {
            show = {
              git = true,
              file = true,
              folder = true,
              folder_arrow = true,
            },
          },
        },
        filters = {
          dotfiles = false,
        },
        git = {
          enable = true,
        },
        diagnostics = {
          enable = true,
          show_on_dirs = true,
          icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
          },
        },
        update_focused_file = {
          enable = true,
          update_root = true,
        },
      })
    end,
  },
}

