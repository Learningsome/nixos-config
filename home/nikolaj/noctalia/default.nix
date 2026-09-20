# home/nikolaj/noctalia.nix
{
  inputs,
  config,
  ...
}: let
  noctaliaPath = "${config.home.homeDirectory}/nixos-config/home/nikolaj/noctalia";
  settingsPath = "${noctaliaPath}/settings.toml";
  picturesPath = "${noctaliaPath}/Pictures/Session";
  wallpapersPath = "${noctaliaPath}/Pictures/Wallpapers";
in {
  imports = [
    inputs.noctalia.homeModules.default
  ];

  # Enabling noctalia
  programs.noctalia.enable = true;

  # Symlink out of this config directory
  home.file = {
    # Noctalia settings can be dynamically changed with GUI
    ".local/state/noctalia/settings.toml".source = config.lib.file.mkOutOfStoreSymlink settingsPath;

    # Session images can be saved through GUI too
    "Pictures/Session" = {
      source = config.lib.file.mkOutOfStoreSymlink picturesPath;
      recursive = true;
    };

    # Walls can be saved through GUI too
    "Pictures/Wallpapers" = {
      source = config.lib.file.mkOutOfStoreSymlink wallpapersPath;
      recursive = true;
    };
  };
}
