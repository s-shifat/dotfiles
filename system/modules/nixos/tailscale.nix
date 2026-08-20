# FIX IT:
# Current Status:
# At fresh startup, after building, reboot then manually run `sudo systemctl restart tailscaled`
# Then: `sudo tailscale up`
# Then: accept from tailscale admin

{ ... }:

{
  services.tailscale = {
    enable = true;

    extraSetFlags = [
      "--shields-up"
      "--operator=shifat"
    ];
  };
}

