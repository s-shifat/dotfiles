{ pkgs, inputs, ... }:
let
  # ==========================================================================
  # TEMPORARY: UNSTABLE PACKAGE SET
  # ==========================================================================
  # This exists only because Ashell is currently installed from nixpkgs-unstable.
  #
  # For now, keeping it here is acceptable.
  # Later, either:
  #
  #   1. Pass pkgsUnstable from flake.nix through specialArgs, or
  #   2. Move Ashell and this import into a focused package module.
  #
  # Possible future destination:
  #   system/modules/nixos/packages.nix
  #
  pkgsUnstable = import inputs.nixpkgs-unstable {
    system = pkgs.stdenv.hostPlatform.system;
    config = pkgs.config;
  };
in

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

    # Installed from nixpkgs-unstable.
    pkgsUnstable.ashell

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

