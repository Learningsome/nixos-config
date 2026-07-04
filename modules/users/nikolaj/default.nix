# ./modules/users/nikolaj/default.nix

{ config, pkgs, ... }:

{
  imports = [
    ./zsh.nix
    ./git.nix
    ./kitty.nix
    ./vim.nix
    ./vscodium.nix
    ./packages.nix
    ./gui.nix
  ];

  home = {
    homeDirectory = "/home/nikolaj";
    stateVersion = "26.05";
    username = "nikolaj";
  };

  # Можно потом вынести в theme.nix или что-то такое
  gtk = {
    enable = true;
    theme = {
      name = "Breeze";
    };
  };
}
