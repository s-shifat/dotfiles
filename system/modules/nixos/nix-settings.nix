{ ... }:

{
  # This configures the Nix package manager itself.

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

}
