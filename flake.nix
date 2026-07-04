# flake.nix

{
  description = "My NixOS configuration, btw";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Git hooks dependencies
    systems.url = "github:nix-systems/default";
    git-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      systems,
      nixpkgs,
      nixpkgs-unstable,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      hostname = "nixos-btw";

      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };

      forEachSystem = nixpkgs.lib.genAttrs (import systems);
    in
    {
      nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = { inherit inputs pkgs-unstable; };

        modules = [
          ./hosts/${hostname}/configuration.nix

          inputs.home-manager.nixosModules.home-manager
        ];
      };

      # Run the hooks with `nix fmt`.
      formatter = forEachSystem (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          config = self.checks.${system}.pre-commit-check.config;
          inherit (config) package configFile;
          script = ''
            ${pkgs.lib.getExe package} run --all-files --config ${configFile}
          '';
        in
        pkgs.writeShellScriptBin "pre-commit-run" script
      );

      # Run the hooks in a sandbox with `nix flake check`.
      # Read-only filesystem and no internet access.
      checks = forEachSystem (system: {
        pre-commit-check = inputs.git-hooks.lib.${system}.run {
          src = ./.;

          # If your hooks are intrusive, avoid running on each commit with a default_states like this:
          # default_stages = ["manual" "pre-push"];

          excludes = [
            "(^|/)hardware-configuration\\.nix$"
          ];

          hooks = {
            # Nix
            nixfmt.enable = true;
            statix = {
              enable = true;
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
      });

      # Enter a development shell with `nix develop`.
      # The hooks will be installed automatically.
      # Or run pre-commit manually with `nix develop -c pre-commit run --all-files`
      devShells = forEachSystem (system: {
        default =
          let
            pkgs = nixpkgs.legacyPackages.${system};
            inherit (self.checks.${system}.pre-commit-check) shellHook enabledPackages;
          in
          pkgs.mkShell {
            buildInputs = enabledPackages;

            shellHook = ''
              ${shellHook}

              echo "🔧 NixOS dev environment ready!"
              echo "✅ Pre-commit hooks installed automatically"
              echo "📦 Run 'pre-commit run --all-files' to check everything manually"
              exec zsh
            '';
          };
      });
    };
}
