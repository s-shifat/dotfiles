-- s-shifat/lsp/init.lua
-- 🧠 Mason + LSP + diagnostics (Neovim 0.11+ safe)

local M = {}

function M.setup()
  local icons = require("s-shifat.utils.icons").diagnostics
  local lspconfig = require("lspconfig")
  local mason = require("mason")
  local mason_lspconfig = require("mason-lspconfig")
  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  -- 🚀 Mason setup
  mason.setup()

  mason_lspconfig.setup({
    ensure_installed = {
      "pyright",
      "lua_ls",
      "bashls",
      "jsonls",
      "yamlls",
      "marksman",
      "texlab",
    },
    automatic_installation = true,
  })

  mason_lspconfig.setup_handlers({
    function(server_name)
      lspconfig[server_name].setup({
        capabilities = capabilities,
        on_attach = require("s-shifat.lsp.on_attach"),
      })
    end,
  })

  -- 🌙 LunarVim-style diagnostic signs (Neovim 0.11+ way)
  vim.diagnostic.config({
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = icons.BoldError,
        [vim.diagnostic.severity.WARN]  = icons.BoldWarning,
        [vim.diagnostic.severity.INFO]  = icons.BoldInformation,
        [vim.diagnostic.severity.HINT]  = icons.BoldHint,
      },
    },
    virtual_text = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
      border = "rounded",
      source = "always",
    },
  })
end

return M
