{ inputs, lib, pkgs, config, outputs, ... }: {
  services.hyprpaper = {
    enable = true;

    settings = {
      splash = false;

      preload = [
        "${config.host-options.home.wallpaper}"
      ];

      wallpaper = [
        ",${config.host-options.home.wallpaper}"
      ];
    };
  };
}
