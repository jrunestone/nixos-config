{ inputs, lib, pkgs, config, outputs, ... }: {  
  home.packages = [
    pkgs.wl-clipboard
  ];

  xdg.enable = true;

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
}
