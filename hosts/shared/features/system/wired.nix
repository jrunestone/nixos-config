{ inputs, lib, pkgs, config, outputs, ... }: {
  networking.wireless.enable = lib.mkDefault false;
  networking.networkmanager.enable = true;
}