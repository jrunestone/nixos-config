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

        "$mod, X, killactive"
        "$mod, C, togglefloating"
        "$mod, V, fullscreen, 1"
        "$mod, B, movetoworkspace, special"
        "$mod CTRL, B, togglespecialworkspace"
        "$mod, Minus, togglesplit"

        "$mod, 0, workspace, 1"
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
    };
  };
}
