_: {
  programs.zed-editor = {
    enable = true;
    extensions = ["nix" "terraform" "ansible"];
    userSettings = {
      theme = {
        mode = "system";
        dark = "Noctalia Dark";
        light = "Noctalia Light";
      };
      languages = {
        Nix = {
          language_servers = ["nixd" "!nil"];
          tab_size = 2;
        };
      };
      lsp = {
        nixd = let
          nixosConfiguration = "nixos-btw";
          flakeRef = "(builtins.getFlake (toString /home/nikolaj/nixos-config/.))";
          nixosOpts = "${flakeRef}.nixosConfigurations.${nixosConfiguration}.options";
        in {
          settings = {
            formatting.command = ["alejandra" "-qq"];
            nixpkgs.expr = "import ${flakeRef}.inputs.nixpkgs { }";
            options = {
              nixos.expr = nixosOpts;
              home-manager.expr = "${nixosOpts}.home-manager.users.type.getSubOptions []";
            };
          };
        };
      };
      base_keymap = "VSCode";
      auto_update = false;
      helix_mode = false;
    };
  };
}
