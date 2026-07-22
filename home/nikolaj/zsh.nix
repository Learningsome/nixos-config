# home/nikolaj/zsh.nix
{
  config,
  pkgs,
  ...
}: let
  mkZshPlugin = pkg: file: {
    name = pkg.pname;
    inherit (pkg) src;
    inherit file;
  };
in {
  programs = {
    zsh = {
      enable = true;

      # Встроенные модули Home Manager
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      plugins = with pkgs; [
        (mkZshPlugin zsh-fzf-tab "fzf-tab.plugin.zsh")
        (mkZshPlugin zsh-autopair "autopair.zsh")
        (mkZshPlugin zsh-you-should-use "you-should-use.plugin.zsh")
        (mkZshPlugin zsh-history-substring-search "zsh-history-substring-search.zsh")
      ];

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
        ls = "eza --icons=auto --git";
        tree = "eza --tree --icons=auto --git-ignore";

        # git
        g = "git";
        gs = "g status";
        ga = "g add";
        gc = "g commit";
        gcm = "gc -m";
        gp = "g push";
        gl = "g pull";
        gd = "g diff";
        gb = "g branch";
        gsw = "g switch";
        gswc = "gsw -c";
        glg = "g log --oneline --graph --decorate";

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
        save = 10000;

        ignoreAllDups = true;
        ignoreSpace = true;
        share = true;
      };
    };

    starship = {
      enable = true;
      enableZshIntegration = true;
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;

      options = ["--cmd cd"];
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
