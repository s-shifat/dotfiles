-- s-shifat/plugins/telescope.lua
-- 🔍 Telescope core + live_grep_args + native FZF support
--
-- 🛠️ Required on Arch:
--   1. Make sure you have `make` and a C compiler (e.g., `gcc` or `clang`)
--      Install with:
--        sudo pacman -S base-devel
--
--   2. For best results with live_grep and other tools, also install:
--        sudo pacman -S ripgrep fd
--
--   3. If using `live_grep_args`, make sure `rg` (ripgrep) is in your PATH
--

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",

      -- 🔍 Live Grep with Args
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        config = function()
          require("telescope").load_extension("live_grep_args")
        end,
      },

      -- ⚡ Native FZF sorter (requires `make`)
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
    },
    cmd = "Telescope",
    keys = {
      { "<leader>sf", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
      { "<leader>sg", "<cmd>Telescope live_grep<CR>", desc = "Live Grep" },
      { "<leader>sb", "<cmd>Telescope buffers<CR>", desc = "Find Buffers" },
      { "<leader>sh", "<cmd>Telescope help_tags<CR>", desc = "Help Tags" },
      { "<leader>sr", "<cmd>Telescope oldfiles<CR>", desc = "Recent Files" },
      { "<leader>sc", "<cmd>Telescope commands<CR>", desc = "Commands" },
      { "<leader>sk", "<cmd>Telescope keymaps<CR>", desc = "Keymaps" },
      { "<leader>sm", "<cmd>Telescope man_pages<CR>", desc = "Man Pages" },
      { "<leader>ss", "<cmd>Telescope grep_string<CR>", desc = "Search Word Under Cursor" },
      { "<leader>st", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", desc = "Live Grep with Args" },
    },
    config = function()
      require("telescope").setup({
        defaults = {
          layout_config = {
            horizontal = { preview_width = 0.6 },
          },
          file_ignore_patterns = {
            "./node_modules/*", "./.git/*", "lazy%-lock.json",
            "./poetry.lock", "./ipynb_checkpoints/*", "./*.ipynb",
            "main%.aux", "main%.log", "main%.out", "main%.toc",
            "main%.bbl", "main%.blg", "main%.lof", "main%.lot",
            "main%.nav", "main%.snm", "main%.fls", "main%.fdb_latexmk",
            "main%.synctex%.gz",
          },
        },
      })
    end,
  },
}
