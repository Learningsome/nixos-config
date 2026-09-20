# modules/common/default.nix
{...}: {
  imports = [
    ./nix.nix
    ./locale.nix
    ./boot.nix
    ./networking.nix
    ./users.nix
    ./fonts.nix
    ./packages.nix
    ./sudo.nix
  ];
}
