{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Terminal utilities
    bat
    eza

    # GUI
    obsidian
    termius

    # IaC
    terraform
    terragrunt

    # Nix LSP
    nixfmt
    nil
    deadnix
    statix

    # VSCodium + extensions
    (vscode-with-extensions.override {
      vscode = vscodium;

      vscodeExtensions = with vscode-extensions; [
        jnoortheen.nix-ide # Поддержка языка Nix
        alefragnani.project-manager # Менеджер проектов
        ms-azuretools.vscode-docker # Работа с Docker
        hashicorp.terraform # IaC
      ];
    })
  ];
}
