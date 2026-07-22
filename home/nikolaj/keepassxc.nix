{ pkgs, ... }:

{
  programs.keepassxc = {
    autostart = true;
    enable = false;
    settings = {
      # For available settings, see https://github.com/keepassxreboot/keepassxc/blob/develop/src/core/Config.cpp
      FdoSecrets = {
        Enabled = true; # Enable Secret Service Integration
        ConfirmAccessItem = false; # Не спрашивать подтверждение при каждом запросе
        ShowNotification = true; # Показывать уведомления
        UnlockBeforeSearch = true; # Если база закрыта — предложить разблокировать
      };

      GUI = {
        ApplicationTheme = "auto";
        Language = "ru";
      };

      Security.IconDownloadFallback = true;
    };
  };

  xdg.autostart.enable = true; # Enable creation of XDG autostart entries.
}
