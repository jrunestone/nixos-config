{ pkgs, lib, config, ... }: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  
  wayland.windowManager.hyprland = {
    enable = true;

    systemd = {
      enable = true;
    };
  };
}
