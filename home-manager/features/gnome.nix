{ pkgs, lib, config, ... }: {
  services.gnome.gnome-initial-setup.enable = false;

  dconf.settings = {
    "org.gnome.desktop.interface" = {
      color-scheme = "prefer-dark";
    };
  };
}
