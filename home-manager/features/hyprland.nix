{ pkgs, lib, config, ... }: {
  # home.packages = [ pkgs.hyprland ];
  
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;
  };

  settings = {

  };
}