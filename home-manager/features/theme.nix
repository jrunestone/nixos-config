{ pkgs, lib, config, ... }: {
  home.packages = [ pkgs.gradience ];

  # TODO: not able to resolve github.com 
  home.activation.gradience-activation = lib.hm.dag.entryAfter ["installPackages"] ''
    PATH="${config.home.path}/bin:$PATH" $DRY_RUN_CMD gradience-cli flatpak-overrides -e both
#    PATH="${config.home.path}/bin:$PATH" $DRY_RUN_CMD gradience-cli download -n "Zorin OS 16 Green Dark"
#    PATH="${config.home.path}/bin:$PATH" $DRY_RUN_CMD gradience-cli apply -n "Zorin OS 16 Green Dark"
  '';

  home.file."${config.xdg.userDirs.documents}/wallpapers" = {
    source = ../wallpapers;
  };

  dconf.settings = {
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
