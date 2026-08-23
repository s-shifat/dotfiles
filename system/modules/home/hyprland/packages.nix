{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Hyprland ecosystem
    hyprpaper
    hyprlock
    hypridle
    hyprlauncher

    # Desktop session
    ashell
    dunst

    # Wayland utilities
    grim
    slurp
    wl-clipboard

    # Runtime utilities used by Hyprland keybindings
    playerctl
    brightnessctl
  ];
}

