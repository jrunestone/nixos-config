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
  };
}
