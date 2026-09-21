{ config, ... }:

let
  tmuxConfigDir =
    "${config.home.homeDirectory}/dotfiles/system/modules/home/tmux/config";
in
{
  xdg.configFile."tmux".source =
    config.lib.file.mkOutOfStoreSymlink tmuxConfigDir;
}
