{ lib, ... }: {
  options = {
    host-options = {
      home = {
        wallpaper = lib.mkOption {
          type = lib.types.path;
          default = ../../../assets/wallpapers/1.png;
        };
      };

      system = {
        autoLogin = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
      };
    };
  };
}
