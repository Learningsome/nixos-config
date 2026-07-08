# home/nikolaj/noctalia.nix

{ inputs, ... }:

{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia = {
    enable = true;
    # TODO: When settings.json will be done clone it to the flake repo
    # settings = (builtins.fromTOML (builtins.readFile ~/.config/noctalia/config.toml));
  };
}
