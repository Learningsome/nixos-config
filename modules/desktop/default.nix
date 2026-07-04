# modules/desktop/default.nix

{ config, pkgs, ... }:

{
  imports = [
    ./plasma.nix
    ./pipewire.nix
    ./printing.nix
    ./bluetooth.nix
  ];
}
