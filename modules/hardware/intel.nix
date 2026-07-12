# modules/hardware/intel.nix

{ config, pkgs, ... }:

{
  hardware = {
    enableAllFirmware = true;
    cpu.intel.updateMicrocode = true;

    graphics = {
      enable = true;

      extraPackages = with pkgs; [
        intel-media-driver
        vpl-gpu-rt
      ];
    };
  };

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
  };
}
