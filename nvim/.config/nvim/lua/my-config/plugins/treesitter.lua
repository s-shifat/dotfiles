return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = { -- Add your preferred languages
          "lua",
          "python",
          "latex",
          "markdown",
          "bash",
        },
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<Leader>si", -- set to `false` to disable one of the mappings
            node_incremental = "<Leader>sn",
            scope_incremental = "<Leader>sc",
            node_decremental = "<Leader>sd",
          },
        },
        auto_install = true,        -- Enable auto-install
        -- My Text Objects
        textobjects = {
        -- SELECTION
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["ic"] = { query = "@codefence.inner", desc = "Select inside code fence" },
              ["ac"] = { query = "@codefence.outer", desc = "Select around code fence" },
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
            }
          },
        }
      }
    end,
  },
}
