{ inputs, lib, pkgs, config, outputs, ... }: {
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings = {
      primary = {
        mode = "dock";
        layer = "top";
        position = "top";
        height = 30;
        modules-left = [ "hyprland/workspaces" ];
        modules-right = [ "clock" "tray" ];
      };
    };
  };
}
