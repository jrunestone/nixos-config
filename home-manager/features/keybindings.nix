{ pkgs, lib, config, ... }: {
  dconf.settings = {
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>t";
      command = "blackbox";
      name = "Open terminal";
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      home = [ "<Super>f" ];
      www = [ "<Super>w" ];
      control-center = [ "<Super>comma" ];
      play = [ "<Super>space" ];
      volume-mute = [ "<Super>m" ];
      
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
      ];
    };

    "org/gnome/shell/keybindings" = {
      show-screenshot-ui = [ "<Super><Shift>s" ];
      toggle-message-tray = lib.gvariant.mkEmptyArray lib.gvariant.type.string;
    };

    "org/gnome/desktop/wm/keybindings" = {
      switch-to-workspace-left = [ "<Super><Control>Left" ];
      switch-to-workspace-right = [ "<Super><Control>Right" ];
      move-to-workspace-left = [ "<Super><Shift>Left" ];
      move-to-workspace-right = [ "<Super><Shift>Right" ];
      move-to-monitor-left = lib.gvariant.mkEmptyArray lib.gvariant.type.string;
      move-to-monitor-right = lib.gvariant.mkEmptyArray lib.gvariant.type.string;
      switch-input-source = lib.gvariant.mkEmptyArray lib.gvariant.type.string;
      switch-input-source-backward = lib.gvariant.mkEmptyArray lib.gvariant.type.string;
    };
  };
}
