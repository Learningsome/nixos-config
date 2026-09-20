# modules/common/packages.nix
{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    # Terminal
    wget
    curl
    file
    git
    btop
    fastfetch
    gnumake
    nh
    nvd

    # Browser of choice
    chromium

    # Media player
    mpv
  ];
}
