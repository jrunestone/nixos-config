
{ inputs, lib, pkgs, config, outputs, ... }: {
  wayland.windowManager.hyprland = {
    settings = {
      monitor = lib.mkForce "eDP-1,highres,auto,1";
    };
  };
}
