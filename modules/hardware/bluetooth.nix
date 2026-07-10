# modules/hardware/bluetooth.nix

{ config, pkgs, ... }:

{
  hardware.bluetooth = {
    enable = true; # enables support for Bluetooth
    powerOnBoot = false; # powers up the default Bluetooth controller on boot

    settings = {
      General = {
        Experimental = true;
      };
    };
  };
}
