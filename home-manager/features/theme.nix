{ pkgs, lib, config, ... }: {
  home.packages = [ 
    pkgs.gnomeExtensions.tiling-assistant
    pkgs.gnomeExtensions.unblank
    pkgs.gnomeExtensions.blur-my-shell
    pkgs.gnomeExtensions.appindicator
    pkgs.gnomeExtensions.dash-to-dock
    pkgs.gnomeExtensions.hide-activities-button
  ];

  home.file.".nix-config-assets" = {
    source = ../../assets;
  };

  dconf.settings = {
    "org/gnome/shell" = {
      enabled-extensions = [
        "tiling-assistant@leleat-on-github"
        "unblank@sun.wxg@gmail.com"
        "blur-my-shell@aunetx"
        "appindicatorsupport@rgcjonas.gmail.com"
        "dash-to-dock@micxgx.gmail.com"
        "Hide_Activities@shay.shayel.org"
      ];
    };

    "org/gnome/shell/extensions/dash-to-dock" = {
      show-show-apps-button = false;
      show-trash = false;
      show-mounts = false;
      hot-keys = false;
      click-action = "minimize";
      disable-overview-on-startup = true;
      background-opacity = 0.85;
      background-color = "rgb(36,36,36)";
      intellihide = false;
      show-icons-notifications-counter = false;
    };

    "org/gnome/shell/extensions/appindicator" = {
      icon-size = 20;
      icon-opacity = 255;
      icon-saturation = 1.0;
    };

    "org/gnome/shell/extensions/blur-my-shell" = {
      sigma = 24;
      brightness = 42;
    };

    "org/gnome/shell/extensions/tiling-assistant" = {
      tile-topleft-quarter = [ "<Super>aring" ];
      tile-topright-quarter = [ "<Super>dead_diaeresis" ];
      tile-bottomleft-quarter = [ "<Super>adiaeresis" ];
      tile-bottomright-quarter = [ "<Super>apostrophe" ];
      window-gap = 4;
    };

    "org/gnome/shell/extensions/unblank" = {
      power = false;
    };

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };

    "org/gnome/desktop/wm/preferences" = {
      workspace-names = [ "Main" ];
    };

    "org/gnome/desktop/background" = {
      picture-uri = "file://${config.home.homeDirectory}/.nix-config-assets/wallpapers/1.jpg";
      picture-uri-dark = "file://${config.home.homeDirectory}/.nix-config-assets/wallpapers/1.jpg";
    };
  };
}
