_:

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
          "docker-compose"
          "kubectl"
          "helm"
          "ansible"
          "terraform"
          "sudo"
          "history"
          "extract"
          "command-not-found"
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
        dnx = "deadnix";
        stx = "statix check";
      };
    };

    git = {
      enable = true;

      settings = {
        user.name = "Nikolaj Kashirskij";
        user.email = "nikolajkashirskij@gmail.com";
        core.editor = "vim";

        pull.rebase = true;
        init.defaultBranch = "main";

        color.ui = true;
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
