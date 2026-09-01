# home/nikolaj/default.nix
{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./zsh.nix
    ./git.nix
    ./kitty.nix
    ./fastfetch.nix
    ./vim.nix
    ./vscodium.nix
    ./packages.nix
    ./gui.nix
    ./noctalia.nix
    ./yazi.nix
    ./udiskie.nix
    ./librewolf.nix
    ./firefox.nix
    ./keepassxc.nix
    ./nvim.nix
  ];

  home = {
    homeDirectory = "/home/nikolaj";
    stateVersion = "26.05";
    username = "nikolaj";
  };
}
