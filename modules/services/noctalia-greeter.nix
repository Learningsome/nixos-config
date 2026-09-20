{inputs, ...}: {
  imports = [
    inputs.noctalia-greeter.nixosModules.default
  ];

  programs.noctalia-greeter = {
    enable = true;

    passwordless-sync-users = ["nikolaj"];

    settings = {
      session.default = "niri";
      user.default = "nikolaj";
      keyboard = {
        layout = "us,ru";
        options = "grp:alts_toggle";
      };
    };
  };
}
