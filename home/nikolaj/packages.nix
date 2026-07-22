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

    # Will test this
    devenv

    # IaC
    terraform
    terragrunt
  ];
}
