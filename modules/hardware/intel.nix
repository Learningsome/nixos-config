# modules/hardware/intel.nix

{ config, pkgs, ... }:

{
  hardware = {
    enableAllFirmware = true;
    cpu.intel.updateMicrocode = true;
  };
}
