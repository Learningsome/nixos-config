{ config, pkgs, ... }:
let
  terminal = "kitty";
  fileManager = "yazi";
in
{
  services.udiskie = {
    enable = true;
    settings = {
      # workaround for
      # https://github.com/nix-community/home-manager/issues/632
      program_options = {
        # replace with your favorite file manager
        file_manager = "${pkgs.terminal}/bin/${terminal} -e ${pkgs.fileManager}/bin/${fileManager}";
      };
    };
  };
}
