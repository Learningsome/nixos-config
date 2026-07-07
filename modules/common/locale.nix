# modules/common/locale.nix

{ config, pkgs, ... }:
let
  timezone = "Europe/Moscow";
  defaultLocale = "en_US.UTF-8";
  extraLocale = "ru_RU.UTF-8";
in
{
  time.timeZone = timezone;

  i18n = {
    inherit defaultLocale;

    extraLocaleSettings = {
      LC_ADDRESS = extraLocale;
      LC_IDENTIFICATION = extraLocale;
      LC_MEASUREMENT = extraLocale;
      LC_MONETARY = extraLocale;
      LC_NAME = extraLocale;
      LC_NUMERIC = extraLocale;
      LC_PAPER = extraLocale;
      LC_TELEPHONE = extraLocale;
      LC_TIME = extraLocale;
    };
  };
}
