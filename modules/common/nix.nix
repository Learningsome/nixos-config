# modules/common/nix.nix
{
  config,
  pkgs,
  ...
}: {
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

  nixpkgs.config.allowUnfree = true;
}
