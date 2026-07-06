# modules/hardware/bluetooth.nix

{ config, pkgs, ... }:

{
  hardware = {
    bluetooth.enable = true; # enables support for Bluetooth
    bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  };
}
