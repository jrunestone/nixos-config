{ inputs, pkgs, lib, config, ... }: {
  imports = [
    inputs.hyprlock.homeManagerModules.default
  ];

  programs.hyprlock = {
    enable = true;
 
    general = {
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
      position = { x = 0; y = 400; };
      halign = "center";
      valign = "center";
    }];

    images = [{
      monitor = "";
      path = "${config.host-options.home.user-icon}";
      rounding = -1;
      position = { x = 0; y = 140; };
      halign = "center";
      valign = "center";
    }];

    input-fields = [{
      monitor = "";
      size = { width = 250; height = 40; };
      outline_thickness = 3;
      rounding = 8;
      dots_size = 0.2;
      dots_spacing = 0.2;
      dots_center = true;
      outer_color = "rgb(${config.colorScheme.palette.base0E})";
      inner_color = "rgb(${config.colorScheme.palette.base06})";
      font_color = "rgb(${config.colorScheme.palette.base00})";
      fade_on_empty = false;
      hide_input = false;
      halign = "center";
      valign = "center";
    }];
  };
}
