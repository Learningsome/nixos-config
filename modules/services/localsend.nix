# modules/services/localsend.nix
_: {
  programs.localsend = {
    enable = true;
    openFirewall = true;
  };
}
