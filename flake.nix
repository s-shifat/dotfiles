{
  description = "System Flake";

  inputs = {
    # Default: unstable
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Secondary: stable, explicitly used when required
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-26.05";

    # Home Manager tracks unstable as well
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ nixpkgs, nixpkgs-stable, home-manager, ... }:
    let
      system = "x86_64-linux";

      pkgsStable = import nixpkgs-stable {
        inherit system;
      };
    in
    {
      nixosConfigurations.wonderwall = nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = {
          inherit inputs pkgsStable;
        };

        modules = [
          ./system/hosts/wonderwall

          # Home Manager framework
          home-manager.nixosModules.home-manager

          # Reusable NixOS modules
          ./system/modules/nixos

          # User definitions
          ./system/users/shifat
        ];
      };
    };
}
