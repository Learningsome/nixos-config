# home/nikolaj/vscodium.nix
{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    nixfmt # Nix formatter
    alejandra
    nil # Nix LSP
  ];

  programs.vscodium = {
    enable = true;
    mutableExtensionsDir = true;

    profiles.default = {
      enableExtensionUpdateCheck = false;
      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide # Поддержка языка Nix
        alefragnani.project-manager # Менеджер проектов
        ms-azuretools.vscode-containers # Работа с Docker
        hashicorp.terraform # IaC
        zhuangtongfa.material-theme # One Dark Pro
        redhat.vscode-yaml # Поддержка .yaml + k8s
        yzhang.markdown-all-in-one # Поддержка .md
      ];

      userSettings = {
        # Настройки терминала (Кавычки экранированы для Nix)
        "terminal.integrated.fontFamily" = "'JetBrainsMono Nerd Font'";
        "terminal.integrated.fontSize" = 14;

        # Настройки форматирования и проводника
        "editor.formatOnSave" = true;
        "explorer.confirmDelete" = false;
        "explorer.compactFolders" = false;

        # Активация темы
        "workbench.colorTheme" = "NoctaliaTheme";

        # Отключение телеметрии и A/B тестов
        "telemetry.telemetryLevel" = "off";

        # Интеграция Nix LSP (nil + alejandra)
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nil";
        "nix.serverSettings" = {
          "nil" = {
            "formatting" = {
              "command" = ["alejandra"];
            };
            "diagnostics" = {
              "ignored" = ["unused_binding"];
            };
          };
        };
      };
    };
  };
}
