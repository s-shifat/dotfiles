{ inputs, pkgs, ... }:

let
  system = pkgs.stdenv.hostPlatform.system;
in
{
  home.packages = [
    inputs.neovim.packages.${system}.nvim
    inputs.neovim.packages.${system}.workflow-tools
  ];
}
