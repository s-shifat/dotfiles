{ pkgs, ... }:

{
  programs.rofi = {
    theme = "transparent";

    settings.terminal = "${pkgs.kitty}/bin/kitty";
  };

  xdg.dataFile."rofi/themes/transparent.rasi".source = ./themes/transparent.rasi;

  xdg.dataFile."rofi/themes/opaque.rasi".source = ./themes/opaque.rasi;
}
