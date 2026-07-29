{ pkgs, ... }:

{
  # Lets regular desktop applications discover and mount storage devices.
  services.udisks2.enable = true;

  # Provides mounting, trash://, network locations, MTP, and other
  # GIO/GVfs functionality used by Thunar.
  services.gvfs.enable = true;

  # Thunar thumbnail service.
  services.tumbler.enable = true;

  # Install and configure Thunar through its NixOS module rather than
  # installing only the bare package.
  programs.thunar = {
    enable = true;

    plugins = with pkgs; [
      thunar-volman
      thunar-archive-plugin
    ];
  };

  # Saves Thunar/Xfce preferences when Thunar is used outside full Xfce.
  programs.xfconf.enable = true;

  # Utilities for common removable-drive filesystems.
  environment.systemPackages = with pkgs; [
    ntfs3g
    exfatprogs
    dosfstools

    # Archive manager used by thunar-archive-plugin.
    # file-roller
    xarchiver
  ];

  # Explicit filesystem support for common external drives.
  boot.supportedFilesystems = [
    "ntfs"
    "exfat"
    "vfat"
  ];
}
