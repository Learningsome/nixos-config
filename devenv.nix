{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  # https://devenv.sh/basics/
  env.GREET = "devenv";

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

  # https://devenv.sh/processes/
  # processes.dev.exec = "${lib.getExe pkgs.watchexec} -n -- ls -la";

  # https://devenv.sh/services/
  # services.postgres.enable = true;

  # https://devenv.sh/scripts/
  # scripts.hello.exec = ''
  #   echo "Hello from $GREET"
  # '';

  # https://devenv.sh/basics/
  enterShell = ''
    echo ""
    echo "🔧 NixOS $GREET environment ready!"
    echo "✅ Pre-commit hooks installed automatically"
    echo "📦 Run 'pre-commit run --all-files' to check everything manually"
  '';

  # https://devenv.sh/tasks/
  # tasks = {
  #   "myproj:setup".exec = "mytool build";
  #   "devenv:enterShell".after = [ "myproj:setup" ];
  # };

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
      nixfmt.enable = true;
      statix.enable = true;

      # Общие проверки
      typos.enable = true;
      end-of-file-fixer.enable = true;
      trim-trailing-whitespace.enable = true;
      check-added-large-files.enable = true;
      check-merge-conflicts.enable = true;
      check-case-conflicts.enable = true;
      # check-executables-have-shebangs.enable = true;

      # При необходимости
      # check-yaml.enable = true;
      # check-json.enable = true;
      # shellcheck.enable = true;
      # shfmt.enable = true;
      # mdsh.enable = true;
    };
  };

  # See full reference at https://devenv.sh/reference/options/
}
