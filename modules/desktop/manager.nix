# modules/desktop/manager.nix

{ config, pkgs, ... }:

{
  services = {
    # Enable the X11 windowing system.
    # You can disable this if you're only using the Wayland session.
    xserver = {
      enable = true;

      # Configure keymap in X11
      xkb = {
        layout = "us,ru";
        options = "grp:alt_shift_toggle";
      };
    };

    # Enable the KDE Plasma Desktop Environment.
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
  };
}
