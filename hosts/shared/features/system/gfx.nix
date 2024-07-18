{ inputs, lib, pkgs, config, outputs, ... }: {
  services.hardware.openrgb.enable = true;

  hardware = {
    graphics.enable = true;
    graphics.enable32Bit = true;
    opentabletdriver.enable = true;
  };
}
