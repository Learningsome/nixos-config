# modules/desktop/default.nix

{ config, pkgs, ... }:

{
  imports = [
    ./plasma-desktop.nix
    ./pipewire.nix
    ./printing.nix
    ./bluetooth.nix
  ];
}
