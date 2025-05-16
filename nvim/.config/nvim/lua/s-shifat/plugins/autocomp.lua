return {
  {
    "saghen/blink.cmp",
    event = "VimEnter",
    version = "1.*",
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        version = "2.*",
        build = (function()
          if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
            return
          end
          return "make install_jsregexp"
        end)(),
        dependencies = {
          {
            "rafamadriz/friendly-snippets",
            config = function()
              -- Load default VSCode snippets
              require("luasnip.loaders.from_vscode").lazy_load()
              -- Load additional user-defined snippets if any
              require("luasnip.loaders.from_vscode").lazy_load({
                paths = { vim.fn.stdpath("config") .. "/snippets" },
              })
              -- Load Lua-based snippets
              require("luasnip.loaders.from_lua").lazy_load({
                paths = { vim.fn.stdpath("config") .. "/luasnippets" },
              })
            end,
          },
        },
        opts = {
          history = true,
          delete_check_events = "TextChanged",
        },
      },
      "folke/lazydev.nvim",
    },

    opts = function()
      local icons = require("s-shifat.utils.icons")
      return {
        keymap = {
          ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
          ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
          ["<CR>"] = { "accept", "fallback" },
          ["<Esc>"] = { "hide", "fallback" },
          ["<PageUp>"] = { "scroll_documentation_up", "fallback" },
          ["<PageDown>"] = { "scroll_documentation_down", "fallback" },
        },

        appearance = {
          nerd_font_variant = "mono",
        },

        completion = {
          documentation = { auto_show = false, auto_show_delay_ms = 500 },
          ghost_text = { enabled = true },

          menu = {
            draw = {
              components = {
                kind_icon = {
                  text = function(ctx)
                    return icons.kind[ctx.kind] or ctx.kind_icon or ""
                  end,
                },
                kind_text = {
                  text = function(ctx)
                    return ctx.kind or ""
                  end,
                },
                label = {
                  text = function(ctx)
                    return ctx.label or ""
                  end,
                },
              },
            },
          },
        },

        sources = {
          default = { "lsp", "lazydev", "snippets", "path", "buffer" },
          providers = {
            lsp = {
              module = "blink.cmp.sources.lsp",
              score_offset = 100,
            },
            lazydev = {
              module = "lazydev.integrations.blink",
              score_offset = 90,
            },
            snippets = {
              module = "blink.cmp.sources.snippets",
              score_offset = 80,
            },
            path = {
              module = "blink.cmp.sources.path",
              score_offset = 70,
            },
            buffer = {
              module = "blink.cmp.sources.buffer",
              score_offset = 60,
            },
          },
        },

        snippets = { preset = "luasnip" },
        fuzzy = { implementation = "lua" },
        signature = { enabled = true },
      }
    end,
  },
}
