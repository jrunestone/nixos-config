{ inputs, lib, pkgs, config, outputs, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      monitor = lib.mkDefault ",preferred,auto,auto";
      
      input = {
        kb_layout = "se";
        repeat_delay = 400;
        repeat_rate = 40;
      };

      "$mod" = "SUPER";

      bind = [
        "$mod, T, exec, kitty"
        "$mod, W, exec, firefox"
        "$mod, S, exec, spotify"
        "$mod, Space, exec, rofi -show drun"

        "$mod, X, killactive"
        "$mod, C, togglefloating"
        "$mod, V, fullscreen, 1"
        "$mod SHIFT, B, movetoworkspace, special"
        "$mod CTRL, B, togglespecialworkspace"
        "$mod, P, pin"

        "$mod, 0, workspace, 2"
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod SHIFT, 0, movetoworkspace, 2"
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod CTRL, Left, workspace, -1"
        "$mod CTRL, Right, workspace, +1"
        "$mod SHIFT, Left, movetoworkspace, -1"
        "$mod SHIFT, Right, movetoworkspace, +1"

        "$mod ALT, Left, movewindow, l"
        "$mod ALT, Right, movewindow, r"
        "$mod ALT, Up, movewindow, u"
        "$mod ALT, Down, movewindow, d"

        "$mod, Left, movefocus, l"
        "$mod, Right, movefocus, r"
        "$mod, Up, movefocus, u"
        "$mod, Down, movefocus, d"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 3;
      };

      decoration = {
        rounding = 10;
      };
    };
  };
}
