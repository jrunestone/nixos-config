{ inputs, lib, pkgs, config, outputs, ... }: {
  services.hardware.openrgb.enable = true;

  hardware = {
    opengl.enable = true;
    opentabletdriver.enable = true;
  };
}