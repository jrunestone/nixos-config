{ inputs, lib, pkgs, config, outputs, ... }: {
  services.xserver.enable = true;

  services.xserver.displayManager.gdm = {
    enable = true;
    wayland = true;
    autoSuspend = false;
  };

  services.xserver.desktopManager.gnome.enable = true;
}
