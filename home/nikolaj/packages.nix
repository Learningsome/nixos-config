{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Terminal utilities
    bat
    eza

    # IaC
    terraform
    terragrunt

    # Development
    obsidian
    termius

    # Social
    discord
    telegram-desktop
  ];
}
