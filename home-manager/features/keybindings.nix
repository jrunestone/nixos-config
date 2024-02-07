{ pkgs, lib, config, ... }: {
  dconf.settings = {
    "org/gnome/shell/keybindings" = {
      show-screenshot-ui = [ "<Super><Alt>s" ];
    };

    "/org/gnome/settings-daemon/plugins/media-keys" = {
      home = [ "<Super>f" ];
    };

    "/org/gnome/desktop/wm/keybindings" = {
      switch-to-workspace-left = [ "<Super><Control>Left" ];
      switch-to-workspace-right = [ "<Super><Control>Right" ];
      move-to-workspace-left = [ "<Super><Shift>Left" ];
      move-to-workspace-right = [ "<Super><Shift>Right" ];
      move-to-monitor-left = [];
      move-to-monitor-right = [];
    };

    "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = [ "<Super>t" ];
      command = "blackbox";
      name = "Open terminal";
    };
  };
}