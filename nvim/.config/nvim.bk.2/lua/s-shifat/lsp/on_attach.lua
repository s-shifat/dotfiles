-- s-shifat/lsp/on_attach.lua
-- 🎯 LunarVim-style LSP keymaps (clean, scoped, silent)

return function(_, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- Go-to navigation
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)

  -- Hover & signature help
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)

  -- Diagnostics
  vim.keymap.set("n", "gl", function()
    vim.diagnostic.open_float({ scope = "line" })
  end, { desc = "Show Line Diagnostics", buffer = bufnr })

  vim.keymap.set("n", "<leader>lj", function()
    vim.diagnostic.jump({ count = 1, float = true })
  end, { desc = "Next Diagnostic", buffer = bufnr })

  vim.keymap.set("n", "<leader>lk", function()
    vim.diagnostic.jump({ count = -1, float = true })
  end, { desc = "Prev Diagnostic", buffer = bufnr })

  -- LSP actions (leader-prefixed)
  vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code Action", buffer = bufnr })
  vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename", buffer = bufnr })


  vim.keymap.set("n", "<leader>lf", function()
    vim.lsp.buf.format({ async = true })
  end, { desc = "Format", buffer = bufnr })

  vim.keymap.set("n", "<leader>ld", "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>",
    { desc = "Buffer Diagnostics", buffer = bufnr })
  vim.keymap.set("n", "<leader>lw", "<cmd>Telescope diagnostics<cr>", { desc = "Project Diagnostics", buffer = bufnr })
  vim.keymap.set("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>",
    { desc = "Document Symbols", buffer = bufnr })
  vim.keymap.set("n", "<leader>le", "<cmd>Telescope quickfix<cr>", { desc = "Telescope Quickfix", buffer = bufnr })

  -- d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
  -- w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
  -- s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
  -- e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
  --
end
