{ inputs, lib, pkgs, config, outputs, ... }: {
  imports = [
    inputs.hyprpaper.homeManagerModules.default
  ];

  services.hyprpaper = {
    enable = true;

    preloads = [
      "${config.host-options.home.wallpaper}"
    ];

    wallpapers = [
      ",${config.host-options.home.wallpaper}"
    ];
  };
}
