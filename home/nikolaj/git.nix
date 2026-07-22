# home/nikolaj/git.nix
{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Nikolaj Kashirskij";
        email = "nikolajkashirskij@gmail.com";
      };

      core.editor = "vim";
      pull.rebase = true;
      init.defaultBranch = "main";
      color.ui = true;
    };
  };
}
