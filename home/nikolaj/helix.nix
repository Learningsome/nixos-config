{pkgs, ...}: {
  home.packages = with pkgs; [
    bash-language-server
    shellcheck
    shfmt
    yaml-language-server
    yamlfmt
    vscode-json-languageserver
    jq
  ];

  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "noctalia";
      editor = {
        line-number = "relative";
        bufferline = "multiple";
        cursorline = true;
        color-modes = true;
        statusline = {
          center = ["version-control"];
          mode = {
            normal = "NORMAL";
            insert = "INSERT";
            select = "SELECT";
          };
        };
        lsp = {
          display-inlay-hints = true;
        };
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
        soft-wrap = {
          enable = true;
          max-wrap = 25;
        };
        indent-guides = {
          render = true;
        };
        end-of-line-diagnostics = "hint";
        inline-diagnostics = {
          cursor-line = "warning";
        };
      };
      keys = {
        normal = {
          C-s = ":w";
          C-q = ":buffer-close";
          C-o = ":open ~/nixos-config/home/nikolaj/helix.nix";
          tab = "move_parent_node_end";
          S-tab = "move_parent_node_start";
          "+".m = ":run-shell-command make";
        };
        insert = {
          S-tab = "move_parent_node_start";
        };
        select = {
          tab = "extend_parent_node_end";
          S-tab = "extend_parent_node_start";
        };
      };
    };
    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter = {
            command = "alejandra";
            args = ["-qq"];
          };
        }
        {
          name = "bash";
          auto-format = true;
          formatter.command = "shfmt";
        }
        {
          name = "yaml";
          auto-format = true;
          formatter = {
            command = "yamlfmt";
            args = ["-"];
          };
        }
        {
          name = "json";
          auto-format = true;
          formatter = {
            command = "jq";
            args = ["."];
          };
        }
      ];
      language-server = {
        nixd = {
          command = "nixd";
          args = ["--semantic-tokens=true"];
          config.nixd = let
            nixosConfiguration = "nixos-btw";
            flakeRef = "(builtins.getFlake (toString /home/nikolaj/nixos-config/.))";
            nixosOpts = "${flakeRef}.nixosConfigurations.${nixosConfiguration}.options";
          in {
            nixpkgs.expr = "import ${flakeRef}.inputs.nixpkgs { }";
            options = {
              nixos.expr = nixosOpts;
              home-manager.expr = "${nixosOpts}.home-manager.users.type.getSubOptions []";
            };
          };
        };
      };
    };
  };
}
