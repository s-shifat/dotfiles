{ pkgs, ... }:

{
  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    # ------------------------------------------------------------------------
    # Core utilities
    # ------------------------------------------------------------------------
    vim
    wget
    git
    curl
    htop
    tmux
    tree

    # ------------------------------------------------------------------------
    # Desktop applications not yet migrated to Home Manager
    # ------------------------------------------------------------------------
    kitty
    pavucontrol

    # ------------------------------------------------------------------------
    # Graphics diagnostics
    # ------------------------------------------------------------------------
    mesa-demos
    vulkan-tools
  ];
}

