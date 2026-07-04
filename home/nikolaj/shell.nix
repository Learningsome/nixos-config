# home/nikolaj/shell.nix

{ config, pkgs, ... }:

{
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
          "docker"
          "kubectl"
          "helm"
          "ansible"
          "terraform"
          "sudo"
          "history"
          "extract"
        ];
        theme = "robbyrussell";
      };

      shellAliases = {
        btw = "echo i use nixos, btw";
        zarina = "echo i love Zarina, btw";
        nrs = "sudo nixos-rebuild switch";
        cat = "bat";
        ls = "eza --icons=auto";
        tree = "ls -T";
      };
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;

      options = [ "--cmd cd" ];
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
