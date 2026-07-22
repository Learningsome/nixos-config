{
  config,
  pkgs,
  ...
}: {
  programs.firefox = {
    enable = true;

    policies = {
      DisableTelemetry = true;
      DisablePocket = true;
      OfferToSaveLogins = false;
    };
  };
}
