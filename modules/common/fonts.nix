# modules/common/fonts.nix
{
  config,
  pkgs,
  ...
}: {
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}
