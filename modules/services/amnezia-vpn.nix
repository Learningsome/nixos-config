# modules/services/amnezia-vpn.nix

{ config, pkgs, ... }:

let
  unstable = import <nixos-unstable> {
    inherit (config.nixpkgs) config;
  };
in
{
  programs.amnezia-vpn = {
    enable = true;
    package = unstable.amnezia-vpn;
  };
}
