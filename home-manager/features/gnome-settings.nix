{ pkgs, lib, config, ... }: {
  dconf.settings = {
    "org/gnome/desktop/search-providers" = {
      disabled = [ 
        "org.gnome.clocks.desktop" 
        "org.gnome.Calendar.desktop" 
        "org.gnome.Nautilus.desktop" 
        "org.gnome.Settings.desktop" 
      ];
    };

    "org/gnome/shell" = {
      favorite-apps = [
        "org.gnome.Nautilus.desktop"
        "com.raggesilver.BlackBox.desktop"
        "vivaldi-stable.desktop"
        "rider.desktop"
        "spotify.desktop"
        "slack.desktop"
      ];
    };
  };
}
