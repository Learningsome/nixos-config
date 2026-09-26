# home/nikolaj/packages.nix
{pkgs, ...}: {
  home.packages = with pkgs; [
    # Terminal utilities
    bat
    eza
    ripgrep
    dust
    duf
    lazygit

    # Using this for dev environments
    devenv

    # GUI
    obsidian
    qbittorrent
    vesktop
    telegram-desktop
  ];
}
