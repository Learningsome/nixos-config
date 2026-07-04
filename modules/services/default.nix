# modules/services/default.nix

{ config, pkgs, ... }:

{
  imports = [
    ./docker.nix
    ./amnezia-vpn.nix
    ./timesyncd.nix
    ./openssh.nix
  ];
}
