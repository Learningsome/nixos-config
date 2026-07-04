{ config, pkgs, ... }:

{
  # Здесь можно добавить общие hardware-настройки
  hardware.enableAllFirmware = true;
  hardware.cpu.intel.updateMicrocode = true;
}
