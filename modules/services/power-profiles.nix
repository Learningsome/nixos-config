# modules/services/power-profiles.nix
{
  config,
  pkgs,
  ...
}: {
  services.power-profiles-daemon.enable = true;
}
