# modules/common/users.nix
{
  config,
  pkgs,
  ...
}: {
  programs.zsh.enable = true;

  users.users.nikolaj = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "Nikolaj";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
  };
}
