-- s-shifat/plugins/git.lua
-- 🔀 Git integration with signs and blame via gitsigns.nvim
--
-- 🛠️ Arch Packages:
--   sudo pacman -S git
--:Gitsigns toggle_current_line_blame

local keymaps = {
  { "<leader>g",  group = "Git" }, -- group
  -- { "<leader>gg", "<cmd>lua require 'lvim.core.terminal'.lazygit_toggle()<cr>",                     desc = "Lazygit",           mode = "n" },
  { "<leader>gj", "<cmd>lua require 'gitsigns'.nav_hunk('next', {navigation_message = false})<cr>", desc = "Next Hunk",         mode = "n" },
  { "<leader>gk", "<cmd>lua require 'gitsigns'.nav_hunk('prev', {navigation_message = false})<cr>", desc = "Prev Hunk",         mode = "n" },
  { "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>",                                   desc = "Blame",             mode = "n" },
  { "<leader>gL", "<cmd>lua require 'gitsigns'.blame_line({full=true})<cr>",                        desc = "Blame Line (full)", mode = "n" },
  { "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>",                                 desc = "Preview Hunk",      mode = "n" },
  { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>",                                   desc = "Reset Hunk",        mode = "n" },
  { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>",                                 desc = "Reset Buffer",      mode = "n" },
  { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>",                                   desc = "Stage Hunk",        mode = "n" },
  {
    "<leader>gu",
    "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
    desc = "Undo Stage Hunk",
    mode = "n"
  },
  { "<leader>go", "<cmd>Telescope git_status<cr>",   desc = "Open changed file", mode = "n" },
  { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch",   mode = "n" },
  { "<leader>gc", "<cmd>Telescope git_commits<cr>",  desc = "Checkout commit",   mode = "n" },
  {
    "<leader>gC",
    "<cmd>Telescope git_bcommits<cr>",
    desc = "Checkout commit(for current file)",
    mode = "n"
  },
  {
    "<leader>gd",
    "<cmd>Gitsigns diffthis HEAD<cr>",
    desc = "Git Diff",
    mode = "n"
  },
}

return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local icons = require("s-shifat.utils.icons").ui
      require("gitsigns").setup({
        signs = {
          add          = { text = icons.BoldLineLeft},
          change       = { text = icons.BoldLineLeft},
          delete       = { text = icons.Triangle},
          topdelete    = { text = icons.Triangle},
          changedelete = { text = icons.BoldLineLeft},
          untracked    = { text = icons.LineVirticalDashed},
        },
        signcolumn = true,
        numhl = false,
        linehl = false,
        word_diff = false,
        current_line_blame = false,
        current_line_blame_opts = {
          delay = 500,
          ignore_whitespace = true,
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          local wk = require("which-key")
          wk.add(keymaps)

          -- Hunk navigation
          vim.keymap.set("n", "]c", function()
            if vim.wo.diff then return "]c" end
            vim.schedule(function() gs.next_hunk() end)
            return "<Ignore>"
          end, { buffer = bufnr, desc = "Next Git Hunk" })

          vim.keymap.set("n", "[c", function()
            if vim.wo.diff then return "[c" end
            vim.schedule(function() gs.prev_hunk() end)
            return "<Ignore>"
          end, { buffer = bufnr, desc = "Previous Git Hunk" })
        end,
      })
    end,
  },
}
