{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  # https://devenv.sh/basics/
  # env.GREET = "NixOS";

  # https://devenv.sh/packages/
  packages = with pkgs; [
    git
    pre-commit
  ];

  # https://devenv.sh/languages/
  languages.nix = {
    enable = true;
    lsp.enable = false;
  };

  # https://devenv.sh/basics/
  enterShell = ''
    # Starship prompt fix
    if [ -f .devenv/zsh/.zshrc ]; then
      sed -i 's/(devenv) //' .devenv/zsh/.zshrc
    fi
  '';

  # https://devenv.sh/tests/
  enterTest = ''
    echo "Running tests"
    git --version | grep --color=auto "${pkgs.git.version}"
  '';

  # https://devenv.sh/git-hooks/
  git-hooks = {
    excludes = [
      "(^|/)hardware-configuration\\.nix$"
    ];

    hooks = {
      alejandra.enable = true;
      statix.enable = true;

      # Общие проверки
      # typos.enable = true;
      end-of-file-fixer.enable = true;
      trim-trailing-whitespace.enable = true;
      check-added-large-files.enable = true;
      check-merge-conflicts.enable = true;
      check-case-conflicts.enable = true;
    };
  };
}
