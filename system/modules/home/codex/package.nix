{ pkgs, ... }:

let
  cx = pkgs.writeShellScriptBin "cx" ''
    exec ${pkgs.codex}/bin/codex --profile default "$@"
  '';
in
{
  home.packages = [
    pkgs.codex
    cx
  ];
}
