# modules/common/default.nix

{ config, pkgs, ... }:

{
  imports = [
    ./nix.nix
    ./locale.nix
    ./boot.nix
    ./networking.nix
    ./users.nix
    ./fonts.nix
    ./packages.nix
  ];

  nixpkgs.config.allowUnfree = true;
}
