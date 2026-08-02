# home/nikolaj/gui.nix
{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # Development
    obsidian
    qbittorrent

    # Social
    vesktop
    telegram-desktop
  ];
}
