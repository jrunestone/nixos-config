{ pkgs, lib, config, ... }: {
  home.packages = [ pkgs.gradience ];

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
      picture-uri = "file:///etc/nix/nix-config/home-manager/features/wallpapers/1.jpg";
      picture-uri-dark = "file:///etc/nix/nix-config/home-manager/features/wallpapers/1.jpg";
    };

    "org/gnome/desktop/wm/preferences" = {
      workspace-names = [ "Main" ];
    };

    "org/gnome/shell" = {
      favorite-apps = []; # TODO: rider, slack, spotify, steam, ...
    };
  };
}
