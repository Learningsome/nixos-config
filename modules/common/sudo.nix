# modules/common/sudo.nix
{
  config,
  pkgs,
  ...
}: {
  security.sudo = {
    enable = true;
    extraRules = [
      {
        groups = ["wheel"];
        commands = [
          {
            # Смена темы noctalia-greeter без запроса пароля
            command = "/run/current-system/sw/bin/noctalia-greeter-apply-appearance";
            options = [
              "NOPASSWD"
              "SETENV"
            ];
          }
        ];
      }
    ];
  };
}
