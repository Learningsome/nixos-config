# home/nikolaj/packages.nix
{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # Terminal utilities
    bat
    eza
    ripgrep
    dust
    duf

    # Will test this
    devenv

    # IaC
    terraform
    terragrunt
  ];
}
