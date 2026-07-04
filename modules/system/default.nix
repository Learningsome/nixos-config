# modules/system/default.nix

{ config, pkgs, ... }:

{
  imports = [
    ./boot.nix
    ./locale.nix
    ./networking.nix
    ./users.nix
    ./fonts.nix
    ./packages.nix
    ./nix.nix
  ];
}
