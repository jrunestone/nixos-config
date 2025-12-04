{ inputs, pkgs, lib, config, ... }: {
  services.hypridle = {
    enable = true;

    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
      };

      listener = [
        {
          timeout = 120;
          on-timeout = "loginctl lock-session";
        }

        {
          timeout = 600;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };
}
