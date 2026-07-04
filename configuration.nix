# configuration.nix

{ config, pkgs, ... }:

{
  imports = [
    <home-manager/nixos>
    ./hardware-configuration.nix
    ./modules/system
    ./modules/desktop
    ./modules/services
  ];

  system.stateVersion = "26.05";
}
