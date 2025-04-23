-- s-shifat/plugins/image.lua
-- 🖼️ Image preview support using Kitty's graphics protocol
--
-- 🛠️ Requirements on Arch:
--   1. Kitty terminal with graphics protocol support
--      Install with:
--        sudo pacman -S kitty
--
--   2. ImageMagick for image processing
--      Install with:
--        sudo pacman -S imagemagick
--
--   3. LuaRocks for managing Lua modules (if not already installed)
--      Install with:
--        sudo pacman -S luarocks
--
--   4. 'magick' Lua module for image.nvim
--      Install with:
--        luarocks install magick
--

-- s-shifat/plugins/image.lua
-- 🖼️ Image preview with Kitty backend using image.nvim
--
-- 🛠️ Arch dependencies:
--   sudo pacman -S kitty imagemagick luarocks
--   luarocks install magick

return {
  {
    "3rd/image.nvim",
    event = "VeryLazy",
    config = function()
      require("image").setup({
        backend = "kitty",
        integrations = {
          markdown = {
            enabled = true,
          },
          neorg = {
            enabled = true,
          },
        },
        max_width = 100,
        max_height = 12,
        max_height_window_percentage = math.huge,
        max_width_window_percentage = math.huge,
        window_overlap_clear_enabled = true,
        window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
      })
    end,
  },
}
