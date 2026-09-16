{ ... }:

{
  # Allow explicitly approved unfree packages.
  nixpkgs.config.allowUnfreePackages = [
    "microsoft-edge"
  ];

  # This configures the Nix package manager itself.
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
