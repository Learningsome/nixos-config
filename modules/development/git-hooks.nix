# modules/development/git-hooks.nix

let
  nix-pre-commit-hooks = import (
    fetchTarball "https://github.com/cachix/git-hooks.nix/tarball/master"
  );
in
{
  # Configured with the module options defined in `modules/pre-commit.nix`:
  pre-commit-check = nix-pre-commit-hooks.run {
    src = ../../.;
    # If your hooks are intrusive, avoid running on each commit with a default_states like this:
    # default_stages = ["manual" "pre-push"];

    excludes = [
      "(^|/)hardware-configuration\\.nix$"
    ];

    hooks = {
      # Nix
      nixfmt.enable = true;
      statix = {
        enable = false;
        settings.ignore = [ "hardware-configuration.nix" ];
      };
      deadnix = {
        enable = false;
        settings.edit = false;
      };

      # Общие проверки
      typos.enable = true;
      end-of-file-fixer.enable = true;
      trim-trailing-whitespace.enable = true;
      check-added-large-files.enable = true;
      check-merge-conflicts.enable = true;

      # При необходимости
      # check-yaml.enable = true;
      # check-json.enable = true;
      # shellcheck.enable = true;
      # shfmt.enable = true;
    };
  };
}
