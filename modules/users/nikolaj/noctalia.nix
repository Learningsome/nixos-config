{ inputs, ... }:

{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia = {
    enable = true;
    # settings = (builtins.fromTOML (builtins.readFile ~/.config/noctalia/config.toml));
  };
}
