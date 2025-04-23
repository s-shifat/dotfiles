-- s-shifat/plugins/treesitter.lua
-- 🌲 Treesitter syntax parsing, highlighting, and text objects
--
-- 🛠️ Arch requirements:
--   sudo pacman -S base-devel tree-sitter
--   (optional: for markdown folding) mkdir -p after/queries/markdown/

return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = {
          "lua", "python", "latex", "markdown", "bash",
          "json", "toml", "vim", "vimdoc", "yaml",
        },
        auto_install = true,

        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },

        indent = {
          enable = true,
        },

        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<leader>si",
            node_incremental = "<leader>sn",
            scope_incremental = "<leader>sc",
            node_decremental = "<leader>sd",
          },
        },

        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["ic"] = { query = "@codefence.inner", desc = "Inside codefence block" },
              ["ac"] = { query = "@codefence.outer", desc = "Around codefence block" },
              ["if"] = "@function.inner",
              ["af"] = "@function.outer",
            },
          },
        },
      }
    end,
  },
}

