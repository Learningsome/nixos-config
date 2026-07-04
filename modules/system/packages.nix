# modules/system/packages.nix

{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Terminal
    wget
    curl
    git
    btop
    fastfetch
    gnumake

    # Browser of choice
    chromium
  ];
}
