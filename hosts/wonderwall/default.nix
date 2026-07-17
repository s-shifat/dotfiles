{ ... }:

{
  imports = [
      ./hardware-configuration.nix
  ];

  networking.hostName = "wonderwall";

  system.stateVersion = "26.05";

}
