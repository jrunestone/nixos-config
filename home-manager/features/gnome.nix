{ pkgs, lib, config, ... }: {
  home.packages = [ pkgs.gradience ];

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
}
