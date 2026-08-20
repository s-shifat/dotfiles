{ pkgs, inputs, ... }:

{
  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    curl
    htop
    tmux
    tree
    # ------------------------------------------------------------------------
    # Desktop applications
    # ------------------------------------------------------------------------
    wofi
    kitty
    dunst
    hyprpaper
    hyprlock
    hypridle

    ashell

    # ------------------------------------------------------------------------
    # Wayland screenshot and clipboard tools
    # ------------------------------------------------------------------------
    grim
    slurp
    wl-clipboard

    # ------------------------------------------------------------------------
    # Desktop control utilities
    # ------------------------------------------------------------------------
    playerctl
    brightnessctl
    pavucontrol

    # ------------------------------------------------------------------------
    # Graphics diagnostics
    # ------------------------------------------------------------------------
    mesa-demos
    vulkan-tools
  ];
}

