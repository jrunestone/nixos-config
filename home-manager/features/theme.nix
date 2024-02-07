{ pkgs, lib, config, ... }: {
  gtk = {
    enable = true;

    theme = {
      name = "SolArc-Dark";
      package = pkgs.solarc-gtk-theme
    };
  };

  gtk3.extraConfig = {
    Settings = ''
      gtk-application-prefer-dark-theme=1
    '';
  };

  gtk4.extraConfig = {
    Settings = ''
      gtk-application-prefer-dark-theme=1
    '';
  };

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

  home.sessionVariables.GTK_THEME = "SolArc-Dark";
}
