{
  config,
  pkgs,
  ...
}: {
  programs.librewolf = {
    enable = false;

    settings = {
      # Включить Firefox Sync
      "identity.fxaccounts.enabled" = true;

      # Убираем всплывающее меню при нажатии alt
      "ui.key.menuAccessKeyFocuses" = true;

      # WebGL нужен для GitHub, карт, Figma, 3D и т.д.
      "webgl.disabled" = false;

      # Блокировать cookie баннеры
      "cookiebanners.service.mode.privateBrowsing" = 2;
      "cookiebanners.service.mode" = 2;

      # Защита от fingerprinting
      "privacy.resistFingerprinting" = true;

      # Включить аппаратное ускорение
      "gfx.webrender.all" = true;

      # Плавный скролл
      "middlemouse.paste" = false;
      "general.autoScroll" = true;
      "general.smoothScroll" = true;

      # Открывать PDF прямо в браузере
      "pdfjs.disabled" = false;
    };
  };

  # Set Librewolf as default browser
  # xdg.mimeApps = {
  #   enable = true;
  #
  #   defaultApplications = {
  #     "text/html" = "librewolf.desktop";
  #     "x-scheme-handler/http" = "librewolf.desktop";
  #     "x-scheme-handler/https" = "librewolf.desktop";
  #     "x-scheme-handler/about" = "librewolf.desktop";
  #     "x-scheme-handler/unknown" = "librewolf.desktop";
  #   };
  # };
}
