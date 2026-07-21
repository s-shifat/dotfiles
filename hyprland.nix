{ config, pkgs, inputs, ... }:
  let 
    pkgsUnstable = import inputs.nixpkgs-unstable {
      system = pkgs.stdenv.hostPlatform.system;
      config = pkgs.config;
    };
  in
{

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.enableRedistributableFirmware = true;

  environment.systemPackages = with pkgs; [
   wofi
   kitty
   dunst
   hyprpaper
   hyprlock
   hypridle
   pkgsUnstable.ashell

   grim
   slurp
   wl-clipboard
   playerctl
   brightnessctl
   pavucontrol

   mesa-demos
   vulkan-tools

  ];

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.xserver.videoDrivers = [ "amdgpu" ];

  security.polkit.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];

  };

}
