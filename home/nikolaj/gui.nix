{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Development
    obsidian
    termius

    # Social
    discord
    telegram-desktop
  ];
}
