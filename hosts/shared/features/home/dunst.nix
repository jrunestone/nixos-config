{ inputs, lib, pkgs, config, outputs, ... }: {
  services.dunst = {
    enable = true;

    settings = {
      global = {
        width = 300;
        height = 300;
        frame_width = 2;
        frame_color = "#${config.colorScheme.palette.base0A}";
        padding = 16;
        horizontal_padding = 16;
        line_height = 0;
        font = "Noto Sans 14";
        format = "<b>%a</b>\\n%s";
        follow = "mouse";
        corner_radius = 7;
        icon_corner_radius = 3;
      };

      urgency_normal = {
        background = "#${config.colorScheme.palette.base00}";
        foreground = "#${config.colorScheme.palette.base06}";
        highlight = "#${config.colorScheme.palette.base08}";
      };

      urgency_low = {
        background = "#${config.colorScheme.palette.base00}";
        foreground = "#${config.colorScheme.palette.base06}";
        highlight = "#${config.colorScheme.palette.base08}";
      };

      urgency_critical = {
        background = "#${config.colorScheme.palette.base00}";
        foreground = "#${config.colorScheme.palette.base09}";
        highlight = "#${config.colorScheme.palette.base08}";
      };
    };
  };
}
