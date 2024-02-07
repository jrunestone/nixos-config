{ pkgs, lib, config, ... }: {
  home.packages = [ pkgs.grub2-themes ];
  
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };

    "org/gnome/desktop/background" = {
      picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/pixels-d.jpg";
      picture-uri-dark = "file:///run/current-system/sw/share/backgrounds/gnome/pixels-d.jpg";
    };

    "org/gnome/desktop/wm/preferences" = {
      workspace-names = [ "Main" ];
    };

    "org/gnome/shell" = {
      favorite-apps = []; # TODO: rider, slack, spotify, steam, ...
    };
  };
}
