return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local mason = require("mason")
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗"
				}
			}
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"texlab",
				"astro",
				"html",
				"cssls",
				"tailwindcss",
				"lua_ls",
				"emmet_ls",
				"pyright",
				"clangd",
			},
			automatic_installation = true
		})

  mason_lspconfig.setup_handlers({
    function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
          on_attach = function(_, bufnr)
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
          ,
        })
      end,
    })


  end
}
