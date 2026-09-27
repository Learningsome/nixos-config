{config, ...}: let
  configDir = "${config.home.homeDirectory}/nixos-config/home/nikolaj/niri";
  configKdl = "${configDir}/config.kdl";
  noctaliaKdl = "${configDir}/noctalia.kdl";
in {
  # Symlink out of this config directory
  xdg.configFile = {
    "niri/config.kdl" = {
      source = config.lib.file.mkOutOfStoreSymlink configKdl;
    };
    "niri/noctalia.kdl" = {
      source = config.lib.file.mkOutOfStoreSymlink noctaliaKdl;
    };
  };
}
