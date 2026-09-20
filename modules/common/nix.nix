# modules/common/nix.nix
{inputs, ...}: {
  nix = {
    settings = {
      auto-optimise-store = true;
      warn-dirty = false;

      trusted-users = [
        "root"
        "@wheel"
      ];

      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
  };

  nixpkgs = {
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      inputs.self.overlays.additions
      inputs.self.overlays.modifications
      inputs.self.overlays.unstable-packages
    ];

    # Configure your nixpkgs instance
    config.allowUnfree = true;
  };
}
