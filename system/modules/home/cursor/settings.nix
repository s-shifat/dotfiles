{ pkgs, ... }:

{
  home.pointerCursor = {
    enable = true;

    name = "catppuccin-mocha-blue-cursors";
    package = pkgs.catppuccin-cursors.mochaBlue;
    size = 10;

    gtk.enable = true;
    x11.enable = true;
    hyprcursor.enable = true;
  };
}
