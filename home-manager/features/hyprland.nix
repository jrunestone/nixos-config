{ pkgs, lib, config, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;

    systemd = {
      enable = true;
    };
  };
}
