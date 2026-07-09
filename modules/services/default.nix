# modules/services/default.nix

{ config, pkgs, ... }:

{
  imports = [
    ./docker.nix
    ./amnezia-vpn.nix
    ./timesyncd.nix
    ./openssh.nix
    ./power-profiles.nix
    ./upower.nix
    ./noctalia-greeter.nix
    ./udisks2.nix
  ];
}
