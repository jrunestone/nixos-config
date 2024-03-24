{ pkgs, lib, config, ... }: {
  dconf.settings = {
    "org/gnome/mutter" = {
      dynamic-workspaces = true;
    };

    "org/gnome/shell/app-switcher" = {
      current-workspace-only = true;
    };
      
    "org/gnome/desktop/wm/preferences" = {
      button-layout = ":minimize,maximize,close";
    };

    "org/gnome/desktop/session" = {
      idle-delay = lib.hm.gvariant.mkUint32 0;
    };

    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-type = "nothing";
    };

    "org/gnome/desktop/sound" = {
      event-sounds = false;
    };

    "org/gnome/desktop/search-providers" = {
      disabled = [ 
        "org.gnome.clocks.desktop" 
        "org.gnome.Calendar.desktop" 
        "org.gnome.Nautilus.desktop" 
        "org.gnome.Settings.desktop" 
        "org.gnome.Software.desktop" 
      ];
    };

    "org/gnome/shell" = {
      favorite-apps = [
        "Alacritty.desktop"
        "vivaldi-stable.desktop"
        "spotify.desktop"
        "obsidian.desktop"
      ];
    };
  };
}
