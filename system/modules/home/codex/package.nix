{ inputs, pkgs, ... }:

let
  codex = inputs.codexPkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.codex;
  cx = pkgs.writeShellScriptBin "cx" ''
    exec ${codex}/bin/codex --profile default "$@"
  '';
in
{
  home.packages = [
    codex
    cx
    pkgs.bubblewrap
  ];
}
