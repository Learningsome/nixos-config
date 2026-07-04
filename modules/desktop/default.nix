# modules/desktop/default.nix

{ config, pkgs, ... }:

{
  imports = [
    ./manager.nix
    ./pipewire.nix
    ./printing.nix
    ./bluetooth.nix
  ];
}
