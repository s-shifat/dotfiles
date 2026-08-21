{ ... }:

{
  home-manager.users.shifat = {
    imports = [
      ../../modules/home
    ];

    home.username = "shifat";
    home.homeDirectory = "/home/shifat";

    # Home Manager compatibility baseline.
    home.stateVersion = "26.05";
  };
}

