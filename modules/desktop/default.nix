# modules/desktop/default.nix
{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./xserver.nix
    ./niri.nix
    ./pipewire.nix
    ./printing.nix
  ];
}
