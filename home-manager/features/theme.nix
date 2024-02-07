{ pkgs, lib, config, ... }: {
  home.packages = [ pkgs.gradience ];

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  home.activation.gradience-activation = lib.hm.dag.entryAfter ["writeBoundary"] ''
    gradience-cli flatpak-overrides -e both
    gradience-cli download -n "Zorin OS 16 Green Dark"
    gradience-cli apply -n "Zorin OS 16 Green Dark"
  '';
}
