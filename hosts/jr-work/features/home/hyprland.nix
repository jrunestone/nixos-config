{ inputs, lib, pkgs, config, outputs, ... }: {
  wayland.windowManager.hyprland = {
    settings = {
      monitor = "eDP-1,highres,auto,1";
    };
  };
}
