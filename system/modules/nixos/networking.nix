{ ... }:

{
  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # This provides the NetworkManager tray applet for graphical sessions.
  # TODO:It could later move to Home Manager if you want it to be user-owned.
  programs.nm-applet.enable = true;

}

