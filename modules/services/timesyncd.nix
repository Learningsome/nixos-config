# modules/services/timesyncd.nix

{ config, pkgs, ... }:

{
  services.timesyncd.enable = true;
}
