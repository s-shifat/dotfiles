{ pkgs, ... }:

{
  users.users.shifat = {
    isNormalUser = true;

    extraGroups = [ 
      "wheel" 
      "networkmanager"
    ];


    packages = with pkgs; [
      stow
    ];
  };


}
