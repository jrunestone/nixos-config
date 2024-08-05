{ inputs, lib, pkgs, config, outputs, ... }: {
  wayland.windowManager.hyprland = {
    settings = {
      monitor = ",3840x2160@120,auto,auto";
    };
  };
}
