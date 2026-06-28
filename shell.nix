let
  pre-commit = import ./modules/git-hooks.nix;
in
(import <nixpkgs> { }).mkShell {
  shellHook = ''
    ${pre-commit.pre-commit-check.shellHook}

    echo "🔧 NixOS dev environment ready!"
    echo "✅ Pre-commit hooks installed automatically"
    echo "📦 Run 'pre-commit run --all-files' to check everything manually"
  '';
  buildInputs = pre-commit.pre-commit-check.enabledPackages;
}
