# modules/services/docker.nix
{
  config,
  pkgs,
  lib,
  ...
}: {
  virtualisation.docker = {
    enable = true;
    enableOnBoot = false;
    autoPrune.enable = true;
  };
}
