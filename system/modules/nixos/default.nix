{ ...}:

{
  imports = [
    ./hardware.nix
    ./boot.nix
    ./locale.nix
    ./networking.nix
    ./power.nix
    ./audio.nix
    ./graphics.nix
    ./amd-gpu.nix
    ./removable-storage.nix
    ./fonts.nix
    ./users.nix
    ./nix-settings.nix
    ./display-manager.nix
    ./packages.nix
    ./ssh.nix
    ./hyprland.nix
    ./polkit.nix
  ];

}
