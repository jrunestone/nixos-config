{ inputs, pkgs, lib, config, ... }: {
  imports = [
    inputs.hyprlock.homeManagerModules.default
  ];

  programs.hyprlock = {
    enable = true;
 
    general = {
      no_fade_in = false;
      grace = 0;
      disable_loading_bar = true;
      ignore_empty_input = true;
    };

    backgrounds = [{
      monitor = "";
      path = "${config.host-options.home.wallpaper}";
      blur_passes = 3;
      contrast = 0.8916;
      brightness = 0.8172;
      vibrancy = 0.1696;
      vibrancy_darkness = 0.0;
    }];

    labels = [{
      monitor = "";
      text = ''cmd[update:1000] echo "$(date +"%H:%M%p")"'';
      color = "rgb(${config.colorScheme.palette.base06})";
      font_size = 120;
      font_family = "Noto Sans";
      position = { x = 0; y = 200; };
      halign = "center";
      valign = "center";
    }];

    images = [{
      monitor = "";
      path = "${config.host-options.home.user-icon}";
      #size = 512
      rounding = -1;
      position = { x = 0; y = 100; };
      halign = "center";
      valign = "center";
    }];

    input-fields = [{
      monitor = "";
      size = { width = 250; height = 60; };
      outline_thickness = 2;
      rounding = 10;
      dots_size = 0.2;
      dots_spacing = 0.2;
      dots_center = true;
      outer_color = "rgb(${config.colorScheme.palette.base00})";
      inner_color = "rgb(${config.colorScheme.palette.base02})";
      font_color = "rgb(${config.colorScheme.palette.base06})";
      fade_on_empty = false;
      hide_input = false;
      #position = 0, -120
      halign = "center";
      valign = "center";
    }];
  };
}
