{ pkgs, ... }:

let
  screenshot-region = pkgs.writeShellApplication {
    name = "screenshot-region";
    runtimeInputs = with pkgs; [ coreutils grim slurp wl-clipboard ];
    text = builtins.readFile ./screenshot-region.sh;
  };
in
{
  home.packages = with pkgs; [
    # Hyprland ecosystem
    hyprpaper
    hyprlock
    hypridle
    hyprlauncher

    # Desktop session
    dunst

    # Wayland utilities
    grim
    slurp
    wl-clipboard
    screenshot-region

    # Runtime utilities used by Hyprland keybindings
    playerctl
    brightnessctl
  ];
}
