{ ... }:

{
  programs.ashell.enable = true;

  xdg.configFile."ashell/config.toml".source = ./config.toml;
}

