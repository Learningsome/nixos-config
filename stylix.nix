{ pkgs, ... }:
let
  stylix = fetchTarball "https://github.com/nix-community/stylix/archive/release-26.05.tar.gz";
in
{
  imports = [
    (import stylix).nixosModules.stylix
  ];

  stylix = {
    enable = true;
    autoEnable = false;

    # image = ./wallpaper.jpg;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";
  };
}
