# modules/system/users.nix

{ config, pkgs, ... }:

{
  programs.zsh.enable = true;
  users.users.nikolaj = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "Nikolaj is using NixOS btw";

    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
  };
}
