# modules/common/boot.nix
{
  config,
  pkgs,
  ...
}: {
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
      };
    };
  };
}
