{ config, pkgs, ... }:

{
  programs.librewolf = {
    enable = true;

    settings = {
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

      # Оставить защиту от fingerprinting включенной
      "privacy.resistFingerprinting" = true;

      # Включить аппаратное ускорение
      "gfx.webrender.all" = true;

      # Плавный скролл
      "general.smoothScroll" = true;

      # Открывать PDF прямо в браузере
      "pdfjs.disabled" = false;
    };
  };
}
