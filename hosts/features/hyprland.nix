{ inputs, lib, pkgs, config, outputs, ... }: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}