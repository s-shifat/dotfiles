return {
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
      require("Comment").setup({
        mappings = {
          basic = false,
          extra = false,
        },
      })

      local api = require("Comment.api")
      local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)

      -- Normal mode: <leader>/ to toggle comment
      vim.keymap.set("n", "<leader>/", function()
        api.toggle.linewise.current()
      end, { desc = "Toggle Comment", noremap = true, silent = true })

      -- Visual mode: <leader>/ to toggle block
      vim.keymap.set("v", "<leader>/", function()
        vim.api.nvim_feedkeys(esc, "nx", false)
        api.toggle.linewise(vim.fn.visualmode())
      end, { desc = "Toggle Comment (Visual)", noremap = true, silent = true })

      -- Insert mode: Alt+/ inserts comment prefix (e.g., "#  ") and stays in insert mode
      vim.keymap.set("i", "<M-/>", function()
        local cs = vim.bo.commentstring or "# %s"
        local prefix = cs:match("^(.*)%%s") or "#"
        vim.api.nvim_put({ prefix .. "  " }, "c", true, true)
      end, { desc = "Insert comment prefix", noremap = true, silent = true })
    end,
  },
}
