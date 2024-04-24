{ inputs, lib, pkgs, config, outputs, ... }: {
  services.hardware.openrgb.enable = true;

  hardware = {
    opengl.enable = true;
    opengl.driSupport32Bit = true;
    opentabletdriver.enable = true;
  };
}
