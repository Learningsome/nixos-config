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
}
