{ config, pkgs, ... }:

{
  programs.librewolf = {
    enable = true;

    settings = {
      # Enable Firefox Sync
      "identity.fxaccounts.enabled" = true;

      # WebGL нужен для GitHub, карт, Figma, 3D и т.д.
      "webgl.disabled" = false;

      # Блокировать cookie баннеры
      "cookiebanners.service.mode.privateBrowsing" = 2;
      "cookiebanners.service.mode" = 2;

      # Не очищать данные при закрытии браузера
      "privacy.clearOnShutdown.history" = false;
      "privacy.clearOnShutdown.cookies" = false;

      # Обычная политика cookies
      "network.cookie.lifetimePolicy" = 0;

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
  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      "text/html" = "librewolf.desktop";
      "x-scheme-handler/http" = "librewolf.desktop";
      "x-scheme-handler/https" = "librewolf.desktop";
      "x-scheme-handler/about" = "librewolf.desktop";
      "x-scheme-handler/unknown" = "librewolf.desktop";
    };
  };
}
