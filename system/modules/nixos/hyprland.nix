{ pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # ==========================================================================
  # MOVE TO: system/modules/nixos/portals.nix
  # OR KEEP IN: system/modules/nixos/hyprland.nix
  # ==========================================================================
  # XDG portals provide desktop integration for:
  #
  #   - screen sharing;
  #   - file picker access;
  #   - screenshots;
  #   - opening URLs;
  #   - sandboxed applications.
  #
  # Because these settings are closely tied to the Wayland desktop,
  # keep them in hyprland.nix for now.
  #
  xdg.portal = {
    enable = true;

    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };
}
