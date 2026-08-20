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

