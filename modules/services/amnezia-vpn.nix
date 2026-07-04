# modules/services/amnezia-vpn.nix

{
  config,
  pkgs,
  inputs,
  ...
}:

let
  unstable = import inputs.nixpkgs-unstable {
    system = pkgs.system;
    config = config.nixpkgs.config;
  };
in
{
  programs.amnezia-vpn = {
    enable = true;
    package = unstable.amnezia-vpn;
  };
}
