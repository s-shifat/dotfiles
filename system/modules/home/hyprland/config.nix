{ config, ... }:


let
  hyprConfigDir =
    "${config.home.homeDirectory}/dotfiles/system/modules/home/hyprland/config";    # TODO: fix the hardcoded path
in
{
  xdg.configFile."hypr".source =
    config.lib.file.mkOutOfStoreSymlink hyprConfigDir;
}
