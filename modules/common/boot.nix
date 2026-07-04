# modules/common/boot.nix

{ config, pkgs, ... }:
let
  disk_id = "77cbdfe7-d621-4ed0-ab7e-f3b1c3ab632d";
in
{
  boot = {
    initrd.luks.devices."luks-${disk_id}".device = "/dev/disk/by-uuid/${disk_id}";

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
}
