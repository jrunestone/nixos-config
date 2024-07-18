{ inputs, lib, pkgs, config, outputs, ... }: {
  services.hyprpaper = {
    enable = true;

    settings = {
      preload = [
        "${config.host-options.home.wallpaper}"
      ];

      wallpaper = [
        ",${config.host-options.home.wallpaper}"
      ];
    };
  };
}
