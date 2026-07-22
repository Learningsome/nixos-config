# home/nikolaj/kitty.nix
{
  config,
  pkgs,
  ...
}: let
  NoctaliaTheme = "~/.config/kitty/themes/noctalia.conf";
in {
  programs.kitty = {
    enable = true;
    enableGitIntegration = true;
    shellIntegration.enableZshIntegration = true;

    # themeFile = "OneDark-Pro";

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 14;
    };

    settings = {
      # Явно подключаем файл темы по относительному пути
      include = NoctaliaTheme;

      # Автошрифты
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";

      # Латентность и производительность
      input_delay = 3;
      repaint_delay = 10;
      sync_to_monitor = "yes";

      # Оформление окна
      draw_minimal_borders = "yes";
      window_margin_width = 3;
      single_window_margin_width = 0;
      window_padding_width = 2;

      # Прозрачность
      background_opacity = 0.85;
      inactive_text_alpha = 0.7;
      background_blur = 1;

      # Курсор
      cursor_trail = 3;
      cursor_trail_decay = "0.1 0.4";

      # Таб‑бар
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";

      # Звук и подтверждения
      enable_audio_bell = "no";
      confirm_os_window_close = 0;
    };
  };
}
