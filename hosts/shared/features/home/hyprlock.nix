{ inputs, pkgs, lib, config, ... }: {
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        disable_loading_bar = true;
        ignore_empty_input = true;
        no_fade_out = true;
      };

      background = [{
        monitor = "";
        path = "${config.host-options.home.wallpaper}";
        blur_passes = 3;
        contrast = 0.8916;
        brightness = 0.8172;
        vibrancy = 0.1696;
        vibrancy_darkness = 0.0;
      }];

      image = [{
        monitor = "";
        path = "${config.host-options.home.user-icon}";
        rounding = -1;
        position = { x = 0; y = 140; };
        halign = "center";
        valign = "center";
      }];

      input-field = [{
        monitor = "";
        size = { width = 250; height = 20; };
        outline_thickness = 4;
        rounding = 0;
        dots_size = 0.2;
        dots_spacing = 0.2;
        dots_center = true;
        outer_color = "rgb(${config.colorScheme.palette.base03})";
        inner_color = "rgb(${config.colorScheme.palette.base06})";
        font_color = "rgb(${config.colorScheme.palette.base02})";
        fail_color = "rgb(${config.colorScheme.palette.base0F})";
        fail_text = "";
        fail_timeout = 1000;
        fade_on_empty = false;
        hide_input = false;
        halign = "center";
        valign = "center";
        placeholder_text= "";
      }];
    };
  };
}
