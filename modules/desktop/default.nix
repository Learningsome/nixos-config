# modules/desktop/default.nix
_: {
  imports = [
    ./xserver.nix
    ./niri.nix
    ./pipewire.nix
    ./printing.nix
  ];
}
