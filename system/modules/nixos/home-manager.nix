{ inputs, pkgsStable, ... }:

{
  home-manager = {
    # Use the same pkgs instance as the NixOS system.
    useGlobalPkgs = true;

    # Install HM packages into /etc/profiles/per-user/<user>.
    useUserPackages = true;

    # Back up unmanaged files/directories that collide with HM-managed paths.
    backupFileExtension = "hm-backup";

    # Make additional flake package sources available
    # inside Home Manager modules.
    extraSpecialArgs = {
      inherit inputs pkgsStable;
    };
  };
}
