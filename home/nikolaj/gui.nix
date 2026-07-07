# ./modules/users/nikolaj/gui.nix

{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Development
    obsidian
    termius

    # Social
    vesktop
    telegram-desktop
  ];
}
