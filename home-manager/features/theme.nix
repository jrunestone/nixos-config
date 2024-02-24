{ pkgs, lib, config, ... }: {
  home.packages = [ 
    pkgs.gradience
    pkgs.gnomeExtensions.tiling-assistant
  ];

  home.file."${config.xdg.userDirs.documents}/wallpapers" = {
    source = ../wallpapers;
  };

  dconf.settings = {
    "org/gnome/shell" = {
      enabled-extensions = [
        "tiling-assistant@leleat-on-github"
      ];
    };

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };

    "org/gnome/desktop/wm/preferences" = {
      workspace-names = [ "Main" ];
    };

    "org/gnome/desktop/background" = {
      picture-uri = "file://${config.xdg.userDirs.documents}/wallpapers/1.jpg";
      picture-uri-dark = "file://${config.xdg.userDirs.documents}/wallpapers/1.jpg";
    };
  };
}
