{
  description = "System Flake";
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

  };

  outputs = inputs @ { self, ...}:{
    nixosConfigurations.wonderwall = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      specialArgs = {
        inherit inputs;
      };

      modules = [ 
        ./hosts/wonderwall
        ./modules/nixos
        ./configuration.nix
        ./hyprland.nix
        ./unstable-apps.nix
      ];

    };

  };

}
