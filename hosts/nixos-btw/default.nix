# hosts/nixos-btw/default.nix
{
  config,
  pkgs,
  pkgs-unstable,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/common
    ../../modules/desktop
    ../../modules/services
    ../../modules/hardware
  ];

  networking.hostName = "nixos-btw";
  system.stateVersion = "26.05";
}
