# modules/services/amnezia-vpn.nix

{ pkgs-unstable, ... }:

{
  programs.amnezia-vpn = {
    enable = true;
    package = pkgs-unstable.amnezia-vpn;
  };
}
