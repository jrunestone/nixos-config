{ inputs, lib, pkgs, config, outputs, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;

    plugins = [
      inputs.Hyprspace.packages.${pkgs.system}.Hyprspace
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
        "hyprlock"
      ];

      # window rules
      windowrulev2 = [
        "workspace special,title:^(Spotify)(.*)$"
        "float, title:^(Spotify)(.*)$"

        "workspace special,class:^(1Password)(.*)$"
        "float, class:^(1Password)(.*)$"

        "workspace special,class:^(Notesnook)(.*)$"
        "float, class:^(Notesnook)(.*)$"

        "stayfocused, title:^()$, class:^(jetbrains-rider)$, floating:1"
      ];

      # plugins
      plugins = {
      };

      # keybinds
      "$mod" = "SUPER";

      bind = [
        "$mod CTRL, T, exec, [float] kitty"
        "$mod CTRL, N, exec, [float] kitty --hold nvim"
        "$mod, T, exec, kitty"
        "$mod, W, exec, firefox"
        "$mod, S, exec, spotify"
        "$mod, N, exec, notesnook"
        "$mod, Space, exec, fuzzel"

        "$mod, L, exec, hyprlock"
        "$mod, dead_diaeresis, overview:toggle"
        "$mod CTRL, Pause, exec, shutdown -r now"
        "$mod CTRL, Delete, exec, shutdown now"
        "$mod SHIFT, S, exec, grimblast copysave area"
        "$mod CTRL, S, exec, grimblast save area - | satty --filename -"

        "$mod, X, killactive"
        "$mod, C, togglefloating"
        "$mod, V, fullscreen, 1"
        "$mod, P, setfloating"
        "$mod, P, pin"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 6"
        "$mod SHIFT, 5, movetoworkspace, 6"
        
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

      # mouse
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      # repeat, locked
      bindel = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioRaiseVolume, exec, notify-send ' ' -a 'Volume' -h string:x-dunst-stack-tag:audio -h int:value:$(awk '{printf(\"%d\", 100 * $2)}' <<< $(wpctl get-volume @DEFAULT_AUDIO_SINK@))"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioLowerVolume, exec, notify-send ' ' -a 'Volume' -h string:x-dunst-stack-tag:audio -h int:value:$(awk '{printf(\"%d\", 100 * $2)}' <<< $(wpctl get-volume @DEFAULT_AUDIO_SINK@))"
        ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
        ", XF86MonBrightnessUp, exec, notify-send ' ' -a 'Brightness' -h string:x-dunst-stack-tag:brightness -h int:value:$(brightnessctl get)"
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
        ", XF86MonBrightnessDown, exec, notify-send ' ' -a 'Brightness' -h string:x-dunst-stack-tag:brightness -h int:value:$(brightnessctl get)"
      ];

      # locked
      bindl = [
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioMute, exec, notify-send ' ' -a 'Volume' -h string:x-dunst-stack-tag:audio -h int:value:$(awk '{printf(\"%d\", 100 * $2)}' <<< $(wpctl get-volume @DEFAULT_AUDIO_SINK@))"
        "$mod, Pause, exec, playerctl play-pause"
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

      misc = {
        disable_hyprland_logo = true;
        force_default_wallpaper = 0;
      };

      debug = {
        disable_logs = false;
      };
    };
  };
}
