# modules/hardware/default.nix
{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./intel.nix
    ./bluetooth.nix
  ];
}
