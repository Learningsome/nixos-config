{ config, pkgs, ... }:

{
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;

      # Встроенные модули Home Manager
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        # fun
        btw = "echo i use nixos, btw";
        zarina = "echo i love Zarina, btw";

        # nix
        nrs = "sudo nixos-rebuild switch --flake ~/nixos-config#nixos-btw";
        nrb = "sudo nixos-rebuild build --flake ~/nixos-config#nixos-btw && nvd diff /run/current-system result";
        nfl = "nix flake lock --update-input";

        # tools
        cat = "bat";
        ls = "eza --icons=auto";
        tree = "eza --tree --icons=auto";

        # git
        g = "git";
        gs = "git status";
        ga = "git add";
        gc = "git commit";
        gp = "git push";
        gl = "git pull";
        gd = "git diff";
        gb = "git branch";
        gsw = "git switch";
        gswc = "git switch -c";
        glg = "git log --oneline --graph --decorate";

        # containers
        d = "docker";
        dc = "docker compose";

        # kubernetes
        k = "kubectl";

        # infrastructure
        tf = "terraform";
        h = "helm";
        a = "ansible";
      };

      history = {
        size = 10000;
        ignoreAllDups = true;
      };
    };

    starship = {
      enable = true;
      enableZshIntegration = true;
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
