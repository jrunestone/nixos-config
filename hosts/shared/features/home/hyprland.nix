{ inputs, lib, pkgs, config, outputs, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      monitor = lib.mkDefault ",preferred,auto,auto";
      
      input = {
        kb_layout = "se";
      };

      "$mod" = "SUPER";

      bind = [
        "$mod, T, exec, kitty"
        "$mod, W, exec, firefox"
        "$mod, Space, exec, rofi -show drun"
      ];
    };
  };
}
