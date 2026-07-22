# modules/desktop/niri.nix

{
  config,
  pkgs-unstable,
  lib,
  ...
}:

{
  programs.niri = {
    enable = true;
    package = pkgs-unstable.niri;
  };

  # Xwayland support
  environment.systemPackages = with pkgs-unstable; [
    xwayland-satellite
  ];

  # Will be using KeePassXC
  # services.gnome.gnome-keyring.enable = lib.mkForce false;

  # NixOS otherwise injects a stripped PATH via Environment= on the niri.service
  # unit which shadows the imported user-manager PATH. Disabling the default
  # lets niri inherit the full PATH set up by niri-session.
  systemd.user.services.niri.enableDefaultPath = false;
}
