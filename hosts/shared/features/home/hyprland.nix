{ inputs, lib, pkgs, config, outputs, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;

    plugins = [
      inputs.hyprland-plugins.packages.${pkgs.system}.hyprexpo
    ];

    settings = {
      monitor = lib.mkDefault ",preferred,auto,auto";
      
      input = {
        kb_layout = "se";
        repeat_delay = 300;
        repeat_rate = 45;
      };

      # startup commands
      exec-once = [
        "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
      ];

      # window rules
      windowrulev2 = [
        "workspace special,title:^(Spotify)(.*)$"
        "float,title:^(Spotify)(.*)$"

        "workspace special,class:^(1Password)(.*)$"
        "float,class:^(1Password)(.*)$"
      ];

      # plugins
      plugins = {
        hyprexpo = {
          columns = 3;
          gap_size = 20;
          bg_col = "rgb(${config.colorScheme.palette.base00})";
          workspace_method = "first 1";
        };
      };

      # keybinds
      "$mod" = "SUPER";

      bind = [
        "$mod, T, exec, kitty"
        "$mod CTRL, T, exec, [float] kitty"
        "$mod, W, exec, firefox"
        "$mod, S, exec, spotify"
        "$mod, Space, exec, fuzzel"
        "$mod, L, exec, hyprlock"
        "$mod, dead_diaeresis, hyprexpo:expo, toggle"
        "$mod CTRL, Pause, exec, shutdown -r now"
        "$mod CTRL, Delete, exec, shutdown now"
        "$mod SHIFT, S, exec, grimblast --freeze copysave area"

        "$mod, Pause, exec, playerctl play-pause"
        "$mod, Delete, exec, playerctl next"
        "$mod, Print, exec, playerctl previous"

        "$mod, X, killactive"
        "$mod, C, togglefloating"
        "$mod, V, fullscreen, 1"
        "$mod, P, setfloating"
        "$mod, P, pin"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        
        "$mod CTRL, Left, workspace, -1"
        "$mod CTRL, Right, workspace, +1"
        "$mod SHIFT, Left, movetoworkspace, -1"
        "$mod SHIFT, Right, movetoworkspace, +1"
        "$mod CTRL, Up, togglespecialworkspace"
        "$mod CTRL, Down, togglespecialworkspace"
        
        "$mod SHIFT, Up, movetoworkspace, special"
        "$mod SHIFT, Up, setfloating"
        "$mod SHIFT, Down, movetoworkspace, e+0"
        "$mod SHIFT, Down, settiled"
        
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
        gaps_in = 15;
        gaps_out = 20;
        border_size = 5;
        "col.inactive_border" = "rgb(${config.colorScheme.palette.base02})";
        "col.active_border" = "rgb(${config.colorScheme.palette.base05})";
      };

      decoration = {
        rounding = 0;
        drop_shadow = true;
        shadow_offset = "5 5";
        shadow_render_power = 2;
        shadow_range = 8;
        "col.shadow" = "rgba(00000045)";
        dim_special = 0.4;
      };

      debug = {
        disable_logs = false;
      };
    };
  };
}
