# hosts/nixos-btw/configuration.nix

{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system
    ../../modules/desktop
    ../../modules/services
  ];

  system.stateVersion = "26.05";
}
