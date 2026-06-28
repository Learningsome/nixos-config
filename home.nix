{ ... }:

{
  imports = [
    <home-manager/nixos>
  ];

  home-manager = {
    # Global home-manager settings
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "backup";

    # Import users
    users.nikolaj = import ./home/nikolaj/default.nix;
  };
}
