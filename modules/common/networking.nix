# modules/common/networking.nix
{
  config,
  pkgs,
  ...
}: {
  # Enable networkmanager
  networking.networkmanager.enable = true;

  # Network manager will not wait for online now
  systemd.services.NetworkManager-wait-online.enable = false;

  # Enables wireless support via wpa_supplicant.
  # networking.wireless.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}
