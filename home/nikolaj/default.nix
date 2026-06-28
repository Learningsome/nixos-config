{ ... }:

{
  imports = [
    ./shell.nix
    ./git.nix
    ./kitty.nix
    ./vim.nix
    ./packages.nix
  ];

  home = {
    homeDirectory = "/home/nikolaj";
    stateVersion = "26.05";
    username = "nikolaj";
  };
}
