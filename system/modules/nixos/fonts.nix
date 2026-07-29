{ pkgs, ... }:

{

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    noto-fonts
    nerd-fonts.caskaydia-cove
  ];

  fonts.fontconfig.enable = true;

}
