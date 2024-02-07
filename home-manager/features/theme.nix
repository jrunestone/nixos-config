{ pkgs, lib, config, ... }: {
  home.packages = [ pkgs.gradience ];

    #mkdir -p ${config.xdg.configHome}/presets/curated
  home.activation.gradience-activation = lib.hm.dag.entryAfter ["installPackages"] ''
    PATH="${config.home.path}/bin:$PATH" $DRY_RUN_CMD gradience-cli flatpak-overrides -e both
    PATH="${config.home.path}/bin:$PATH" $DRY_RUN_CMD gradience-cli download -n "Zorin OS 16 Green Dark"
    PATH="${config.home.path}/bin:$PATH" $DRY_RUN_CMD gradience-cli apply -n "Zorin OS 16 Green Dark"
  '';

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
