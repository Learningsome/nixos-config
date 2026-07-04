# modules/desktop/bluetooth.nix

{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kdePackages.bluedevil # Bluetooth package
  ];

  hardware = {
    bluetooth.enable = true; # enables support for Bluetooth
    bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  };
}
