{ inputs, pkgs, ... }: {

  imports = [
    inputs.noctalia-greeter.nixosModules.default
  ];

  programs.noctalia-greeter = {
    enable = true;

    # Optional configuration
    greeter-args = "--sessions niri --user nikolaj";
  };
}
