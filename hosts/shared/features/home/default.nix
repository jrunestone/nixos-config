{ inputs, lib, pkgs, config, outputs, ... }: {  
  xdg.enable = true;

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
}
