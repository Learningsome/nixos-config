# modules/system/networking.nix

{ config, pkgs, ... }:

{
  networking = {
    hostName = "nixos-btw";
    networkmanager.enable = true;
  };

  # Enables wireless support via wpa_supplicant.
  # networking.wireless.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}
