{ pkgs, lib, config, ... }: {
  home.packages = [ pkgs.hyprlock ];

  xdg.configFile."hypr/hyprlock.conf".text = ''
    background {
      monitor =
      path = ${../../../../assets/wallpapers}/1.png
      blur_passes = 3
      contrast = 0.8916
      brightness = 0.8172
      vibrancy = 0.1696
      vibrancy_darkness = 0.0
    }

    general {
      no_fade_in = false
      grace = 0
      disable_loading_bar = true
    }

    label {
      monitor =
      text = cmd[update:1000] echo "$(date +"%H:%M%p")"
      color = $foreground
      font_size = 120
      font_family = FiraCode Nerd Font
      position = 0, 200
      halign = center
      valign = center
    }

    image {
      monitor =
      path = ${../../../../assets}/jr.png
      #size = 512
      rounding = -1
      position = 0, 100
      halign = center
      valign = center
    }

    input-field {
      monitor =
      size = 250, 60
      outline_thickness = 2
      rounding = 10
      dots_size = 0.2
      dots_spacing = 0.2
      dots_center = true
      outer_color = rgba(0, 0, 0, 0)
      inner_color = rgba(0, 0, 0, 0.5)
      font_color = rgb(200, 200, 200)
      fade_on_empty = false
      font_family = FiraCode Nerd Font
      hide_input = false
      #position = 0, -120
      halign = center
      valign = center
    }
  '';
}
