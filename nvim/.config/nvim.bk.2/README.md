~/.config/nvim/
├── init.lua                        # Minimal entry point (just require)
├── after/                          # Post-plugin customizations
│   ├── ftplugin/                   # Filetype-specific settings
│   │   ├── python.lua
│   │   ├── markdown.lua
│   │   └── tex.lua
│   └── queries/                    # Custom Tree-sitter queries
│       └── markdown/
│           ├── highlights.scm
│           └── textobjects.scm
├── snippets/                       # Custom snippet collections
│   ├── lua/                        # Lua format snippets (for LuaSnip)
│   │   └── *.lua
│   └── json/                       # JSON format snippets (VSCode-style)
│       └── *.json
└── lua/
    └── s-shifat/                   # Your actual config modules
        ├── init.lua               # Loads core, plugins, etc.
        ├── core/
        │   ├── options.lua
        │   ├── keymaps.lua
        │   ├── autocmds.lua
        │   └── plugins.lua
        ├── plugins/
        │   ├── cmp.lua
        │   ├── telescope.lua
        │   ├── treesitter.lua
        │   ├── snippets.lua
        │   └── others.lua
        ├── lsp/
        │   ├── init.lua
        │   ├── servers.lua
        │   └── none-ls.lua
        ├── lang/
        │   ├── python.lua
        │   ├── markdown.lua
        │   └── latex.lua
        └── utils/
            └── init.lua

