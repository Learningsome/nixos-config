{inputs, ...}: {
  imports = [
    inputs.noctalia-greeter.nixosModules.default
  ];

  services.displayManager.noctalia-greeter = {
    enable = true;

    passwordless-sync-users = ["nikolaj"];

    settings = {
      session.default = "niri";
      user.default = "nikolaj";
      output.scale = 1.5;
      keyboard = {
        layout = "us,ru";
        options = "grp:alts_toggle";
        numlock = true;
      };
    };
  };
}
