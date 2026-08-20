{
  description = "System Flake";

  inputs = {
    # Default: unstable
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Secondary: stable, explicitly used when required
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-26.05";
  };

  outputs =
    inputs@{ nixpkgs, nixpkgs-stable, ... }:
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
          ./system/modules/nixos
        ];
      };
    };
}

