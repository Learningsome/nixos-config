# modules/services/amnezia-vpn.nix
{pkgs, ...}: {
  programs.amnezia-vpn = {
    enable = true;
    package = pkgs.unstable.amnezia-vpn;
  };
}
