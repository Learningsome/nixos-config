# modules/services/default.nix
_: {
  imports = [
    ./docker.nix
    ./amnezia-vpn.nix
    ./timesyncd.nix
    ./openssh.nix
    ./power-profiles.nix
    ./upower.nix
    ./noctalia-greeter.nix
    ./udisks2.nix
    ./thermald.nix
    ./localsend.nix
  ];
}
