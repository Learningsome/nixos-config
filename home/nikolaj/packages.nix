# home/nikolaj/packages.nix
{pkgs, ...}: {
  home.packages = with pkgs; [
    # Terminal utilities
    bat
    eza
    ripgrep
    dust
    duf
    lazygit

    # Will test this
    devenv

    # IaC
    terraform
    terragrunt
  ];
}
