{ config, pkgs, inputs, ... }:

  let 
    pkgsUnstable = import inputs.nixpkgs-unstable {
      system = pkgs.stdenv.hostPlatform.system;
      config = pkgs.config;
    };
  in
  {
    environment.systemPackages = with pkgsUnstable; [
    ];

  }

