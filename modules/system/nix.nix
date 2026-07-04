# modules/system/nix.nix

{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    auto-optimise-store = true;
    # experimental-features = [ "nix-command" "flakes" ];  # Включить flakes
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
}
