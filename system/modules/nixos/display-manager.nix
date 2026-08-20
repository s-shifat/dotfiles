{ ... }:

{
  # SDDM greeter runs on X11.
  # Hyprland itself still runs as Wayland after login.
  services.xserver.enable = true;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = false;
  };
}
