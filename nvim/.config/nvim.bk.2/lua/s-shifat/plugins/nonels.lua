-- s-shifat/plugins/none-ls.lua
-- 🧩 none-ls.nvim setup with Ruff, Mypy, Bandit, Pydocstyle for full Python coverage

return {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "jay-babu/mason-null-ls.nvim",
    "gbprod/none-ls-shellcheck.nvim",
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    local mason_null_ls = require("mason-null-ls")

    -- 🛠 Auto-install Python & other tools via Mason
    mason_null_ls.setup({
      ensure_installed = {
        -- 🐍 Python Ecosystem
        "ruff",          -- Lint + Format
        "mypy",          -- Type checking
        "bandit",        -- Security linter
        "pydocstyle",    -- Docstring linter

        -- 🧠 Other common tools
        "stylua",        -- Lua formatter
        "prettier",      -- Web (HTML/JS/CSS/MD)
        "eslint_d",      -- JS diagnostics
        "markdownlint",  -- Markdown linter
        "shellcheck",    -- Shell diagnostics
        "shfmt",
      },
      methods = {
        diagnostics = false,
        formatting = true,
        code_actions = true,
        completion = true,
        hover = true,
      },

      automatic_installation = true,
    })

    null_ls.setup({
      sources = {
        -- 💻 Others
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.markdownlint,
        require("none-ls-shellcheck.diagnostics"),
        require("none-ls-shellcheck.code_actions"),
        require("none-ls.diagnostics.cpplint"),
        require("none-ls.formatting.jq"),
        require("none-ls.code_actions.eslint"),
      },
      on_attach = require("s-shifat.lsp.on_attach"),
    })
  end,
}

